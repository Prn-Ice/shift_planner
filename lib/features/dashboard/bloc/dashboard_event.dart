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

class DashboardLogout extends DashboardEvent {
  const DashboardLogout();
}
