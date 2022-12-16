import 'dart:developer';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:task_repository/task_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'exceptions/exceptions.dart';

part 'i_task_repository.dart';

class TaskRepository implements ITaskRepository {
  TaskRepository({
    required AuthenticationRepository authenticationRepository,
    FirebaseFirestore? firestore,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _authenticationRepository = authenticationRepository {
    _moveUncompleted();
  }

  final FirebaseFirestore _firestore;
  final AuthenticationRepository _authenticationRepository;

  CollectionReference<NurseTasks> get _tasksRef {
    return _firestore
        .collection(ITaskRepository.collectionName)
        .withConverter<NurseTasks>(
          fromFirestore: (s, _) {
            try {
              return NurseTasks.fromJson(s.data()!);
            } catch (e) {
              return const NurseTasks();
            }
          },
          toFirestore: (tasks, _) => tasks.toJson(),
        );
  }

  @override
  Future<NurseTasks?> get tasksOneShot {
    final userId = _authenticationRepository.currentUser.id;

    return _tasksRef.doc(userId).get().then((snapshot) => snapshot.data());
  }

  @override
  Stream<NurseTasks?> get tasks {
    final userId = _authenticationRepository.currentUser.id;

    return _tasksRef
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data())
        .shareValue();
  }

  @override
  TaskEither<String, bool> createTask(NurseTask task) {
    return TaskEither.tryCatch(
      () async {
        final current = await tasksOneShot;
        if (current?.tasks?.contains(task) ?? false) {
          throw DuplicateTaskException();
        }

        final userId = _authenticationRepository.currentUser.id;
        // ignore: omit_local_variable_types
        final List<NurseTask> newTasks = [...current?.tasks ?? [], task];
        final request = NurseTasks(tasks: newTasks);

        await _tasksRef.doc(userId).set(request);

        return true;
      },
      (e, s) => 'Failed to create task: $e',
    );
  }

  @override
  TaskEither<String, bool> deleteTask(NurseTask task) {
    return TaskEither.tryCatch(
      () async {
        final current = await tasksOneShot;
        final tasks = current?.tasks ?? [];
        final taskIndex = tasks.indexOf(task);
        if (taskIndex == -1) {
          throw TaskNotFoundException();
        }

        final userId = _authenticationRepository.currentUser.id;
        final newTasks = tasks.toList()..removeAt(taskIndex);
        final request = NurseTasks(tasks: newTasks);

        await _tasksRef.doc(userId).set(request);

        return true;
      },
      (e, s) => 'Failed to delete task: $e',
    );
  }

  @override
  TaskEither<String, bool> updateTask(NurseTask task, NurseTask update) {
    return TaskEither.tryCatch(
      () async {
        final current = await tasksOneShot;
        final tasks = current?.tasks ?? [];
        final taskIndex = tasks.indexOf(task);
        if (taskIndex == -1) {
          throw TaskNotFoundException();
        }

        final userId = _authenticationRepository.currentUser.id;
        final newTasks = tasks.toList()
          ..removeAt(taskIndex)
          ..insert(taskIndex, update);
        final request = NurseTasks(tasks: newTasks);

        await _tasksRef.doc(userId).set(request);

        return true;
      },
      (e, s) => 'Failed to update task: $e',
    );
  }

  Future<void> _moveUncompleted() async {
    try {
      final current = await tasksOneShot;
      final tasks = current?.tasks ?? [];
      final unCompletedOld = tasks.where(
        (element) {
          final old = element.dueDate.dayMonthYear
              .isBefore(DateTime.now().dayMonthYear);
          final incomplete = !(element.isComplete ?? false);

          return old && incomplete;
        },
      );
      final renewed = unCompletedOld.map((e) {
        return e.copyWith(dueDate: e.dueDate?.add(const Duration(days: 1)));
      });

      final newTasks = tasks.toList()
        ..removeWhere(unCompletedOld.contains)
        ..addAll(renewed);
      final userId = _authenticationRepository.currentUser.id;
      final request = NurseTasks(tasks: newTasks);

      await _tasksRef.doc(userId).set(request);
    } catch (e) {
      log('Failed to move uncompleted tasks: $e');
    }
  }
}

extension on DateTime? {
  DateTime get dayMonthYear {
    try {
      return DateTime(this!.year, this!.month, this!.day);
    } catch (e) {
      return DateTime.now();
    }
  }
}
