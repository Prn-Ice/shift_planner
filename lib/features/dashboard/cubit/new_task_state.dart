part of 'new_task_cubit.dart';

class NewTaskState extends Equatable {
  const NewTaskState({
    this.title = const GeneralInput.pure(),
    this.shift = const GeneralInput.pure(),
    this.date = const GeneralInput.pure(),
    this.status = FormzStatus.pure,
    this.error = '',
  });

  final GeneralInput title;
  final GeneralInput shift;
  final GeneralInput date;
  final FormzStatus status;
  final String error;

  @override
  List<Object> get props => [title, shift, date, status, error];

  NewTaskState copyWith({
    GeneralInput? title,
    GeneralInput? shift,
    GeneralInput? date,
    FormzStatus? status,
    String? error,
  }) {
    return NewTaskState(
      title: title ?? this.title,
      shift: shift ?? this.shift,
      date: date ?? this.date,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
