// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:riverbloc/riverbloc.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/app/models/general_input.dart';

part 'new_task_state.dart';

class NewTaskCubit extends Cubit<NewTaskState> {
  NewTaskCubit(
    this._taskRepository,
    this._router,
  ) : super(const NewTaskState());

  final ITaskRepository _taskRepository;
  final AppRouter _router;

  void onTitleChanged(String value) {
    final title = GeneralInput.dirty(value);
    final status = Formz.validate([title, state.date, state.shift]);

    emit(state.copyWith(title: title, status: status));
  }

  void onDateChanged(String value) {
    final date = GeneralInput.dirty(value);
    final status = Formz.validate([state.title, date, state.shift]);

    emit(state.copyWith(date: date, status: status));
  }

  void onShiftChanged(String value) {
    final shift = GeneralInput.dirty(value);
    final status = Formz.validate([state.title, state.date, shift]);

    emit(state.copyWith(shift: shift, status: status));
  }

  Future<void> onCreateTask() async {
    final request = NurseTask(
      title: state.title.value,
      isComplete: false,
      dueDate: DateTime.parse(state.date.value),
      shift: Shift.values.firstWhere(
        (element) => element.name == state.shift.value,
      ),
    );

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final response = await _taskRepository.createTask(request).run();

    response.match(
      (l) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, error: l));
      },
      (r) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      },
    );

    await _router.pop();
  }
}

final newTaskProvider = BlocProvider.autoDispose<NewTaskCubit, NewTaskState>(
  (ref) {
    return NewTaskCubit(resolve(), resolve());
  },
);
