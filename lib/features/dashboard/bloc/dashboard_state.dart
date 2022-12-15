part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  const DashboardState({
    this.user,
  });

  final User? user;

  @override
  List<Object?> get props => [user];

  DashboardState copyWith({
    User? user,
  }) {
    return DashboardState(
      user: user ?? this.user,
    );
  }
}
