part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardFetchUser extends DashboardEvent {
  const DashboardFetchUser();
}

class DashboardFetchTasks extends DashboardEvent {
  const DashboardFetchTasks();
}

class DashboardDeleteTask extends DashboardEvent {
  const DashboardDeleteTask(this.task);

  final NurseTask task;

  @override
  List<Object> get props => [task];
}

class DashboardLogout extends DashboardEvent {
  const DashboardLogout();
}
