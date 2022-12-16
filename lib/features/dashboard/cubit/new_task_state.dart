part of 'new_task_cubit.dart';

class NewTaskState extends Equatable {
  const NewTaskState({
    this.title = const GeneralInput.pure(),
    this.date = const GeneralInput.pure(),
    this.time = const GeneralInput.pure(),
    this.status = FormzStatus.pure,
    this.error = '',
    this.shift,
  });

  final GeneralInput title;
  final Shift? shift;
  final GeneralInput date;
  final GeneralInput time;
  final FormzStatus status;
  final String error;

  @override
  List<Object?> get props => [title, shift, date, time, status, error];

  NewTaskState copyWith({
    GeneralInput? title,
    Shift? shift,
    GeneralInput? date,
    GeneralInput? time,
    FormzStatus? status,
    String? error,
  }) {
    return NewTaskState(
      title: title ?? this.title,
      shift: shift ?? this.shift,
      date: date ?? this.date,
      time: time ?? this.time,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
