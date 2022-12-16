part of 'edit_task_cubit.dart';

class EditTaskState extends Equatable {
  const EditTaskState({
    this.oldTask,
    this.title = const GeneralInput.pure(),
    this.date = const GeneralInput.pure(),
    this.time = const GeneralInput.pure(),
    this.status = FormzStatus.pure,
    this.error = '',
    this.shift,
  });

  final NurseTask? oldTask;
  final GeneralInput title;
  final Shift? shift;
  final GeneralInput date;
  final GeneralInput time;
  final FormzStatus status;
  final String error;

  @override
  List<Object?> get props {
    return [oldTask, title, shift, date, time, status, error];
  }

  EditTaskState copyWith({
    NurseTask? oldTask,
    GeneralInput? title,
    Shift? shift,
    GeneralInput? date,
    GeneralInput? time,
    FormzStatus? status,
    String? error,
  }) {
    return EditTaskState(
      oldTask: oldTask ?? this.oldTask,
      title: title ?? this.title,
      shift: shift ?? this.shift,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
