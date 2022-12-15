part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.user,
    this.tasks = const IListConst([]),
  });

  final User? user;
  final IList<NurseTask> tasks;

  @override
  List<Object?> get props => [user, tasks];

  DashboardState copyWith({
    User? user,
    IList<NurseTask>? tasks,
  }) {
    return DashboardState(
      user: user ?? this.user,
      tasks: tasks ?? this.tasks,
    );
  }
}

extension DashboardStateX on DashboardState {
  List<NurseTask> tasksByDate(DateTime date) {
    return tasks
        .where((element) => element.dueDate.dayMonthYear == date.dayMonthYear)
        .toList();
  }

  Map<Shift?, List<NurseTask>> tasksGrouped(DateTime date) {
    return tasksByDate(date).groupListsBy((element) => element.shift);
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
