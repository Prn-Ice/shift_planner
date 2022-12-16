part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.user,
    this.tasks = const IListConst([]),
    this.status = FormzStatus.pure,
    this.error = '',
  });

  final User? user;
  final IList<NurseTask> tasks;
  final FormzStatus status;
  final String error;

  @override
  List<Object?> get props => [user, tasks, status, error];

  DashboardState copyWith({
    User? user,
    IList<NurseTask>? tasks,
    FormzStatus? status,
    String? error,
  }) {
    return DashboardState(
      user: user ?? this.user,
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}

extension DashboardStateX on DashboardState {
  List<NurseTask> get tasksSorted => tasks
      .sortedBy<DateTime>((element) => element.dueDate ?? DateTime.now())
      .reversedView;

  List<NurseTask> tasksByDate(DateTime date) {
    return tasksSorted
        .where((element) => element.dueDate.dayMonthYear == date.dayMonthYear)
        .toList();
  }

  Map<Shift?, List<NurseTask>> tasksByDateGrouped(DateTime date) {
    return tasksByDate(date).groupListsBy((element) => element.shift);
  }

  Map<Shift?, List<NurseTask>> get allTasksGrouped {
    return tasksSorted.groupListsBy((element) => element.shift);
  }

  Map<Shift?, List<NurseTask>> get completedTasksGrouped {
    return tasksSorted
        .where((element) => element.isComplete ?? false)
        .groupListsBy((element) => element.shift);
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
