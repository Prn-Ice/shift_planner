// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:riverbloc/riverbloc.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/app/models/general_input.dart';

part 'edit_task_state.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit(
    this._taskRepository,
    this._router,
  ) : super(const EditTaskState());

  final ITaskRepository _taskRepository;
  final AppRouter _router;

  void onOldTaskChanged(NurseTask oldTask) {
    emit(state.copyWith(oldTask: oldTask));

    onTitleChanged(oldTask.title ?? '');
    onDateChanged(oldTask.dueDate?.toIso8601String() ?? '');
    onTimeChanged(oldTask.dueDate?.toIso8601String() ?? '');
  }

  void onTitleChanged(String value) {
    final title = GeneralInput.dirty(value);
    final status = Formz.validate([title, state.date, state.time]);

    emit(state.copyWith(title: title, status: status));
  }

  void onDateChanged(String value) {
    final date = GeneralInput.dirty(value);
    final status = Formz.validate([state.title, date, state.time]);

    emit(state.copyWith(date: date, status: status));
  }

  void onTimeChanged(String value) {
    final time = GeneralInput.dirty(value);
    final status = Formz.validate([state.title, state.date, time]);

    emit(state.copyWith(time: time, status: status));

    final timeAsDateTime = DateTime.parse(state.time.value);
    _onShiftChanged(timeAsDateTime);
  }

  void _onShiftChanged(DateTime time) {
    final isMorningShift =
        time.isAfter(DateTime(time.year, time.month, time.day, 6, 29)) &&
            time.isBefore(DateTime(time.year, time.month, time.day, 14, 01));

    final isEveningShift =
        time.isAfter(DateTime(time.year, time.month, time.day, 14)) &&
            time.isBefore(DateTime(time.year, time.month, time.day, 21, 31));

    if (isMorningShift) {
      emit(state.copyWith(shift: Shift.morning));
    } else if (isEveningShift) {
      emit(state.copyWith(shift: Shift.evening));
    } else {
      emit(state.copyWith(shift: Shift.night));
    }
  }

  Future<void> onUpdateTask() async {
    final date = DateTime.parse(state.date.value);
    final time = DateTime.parse(state.time.value);
    final dateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    final request = NurseTask(
      title: state.title.value,
      isComplete: false,
      dueDate: dateTime,
      shift: state.shift,
    );

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final response =
        await _taskRepository.updateTask(state.oldTask!, request).run();

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

final editTaskProvider = BlocProvider.autoDispose<EditTaskCubit, EditTaskState>(
  (ref) {
    return EditTaskCubit(resolve(), resolve());
  },
);
