// Dart imports:
import 'dart:async';

// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:riverbloc/riverbloc.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/app/injection/injection.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this._authenticationRepository,
    this._taskRepository,
  ) : super(const DashboardState()) {
    on<DashboardFetchUser>(_onFetchUser);
    on<DashboardFetchTasks>(_onFetchTasks);
  }

  final AuthenticationRepository _authenticationRepository;
  final ITaskRepository _taskRepository;

  FutureOr<void> _onFetchUser(
    DashboardFetchUser event,
    Emitter<DashboardState> emit,
  ) {
    final user = _authenticationRepository.currentUser;

    emit(state.copyWith(user: user));
  }

  FutureOr<void> _onFetchTasks(
    DashboardFetchTasks event,
    Emitter<DashboardState> emit,
  ) {
    return emit.forEach<NurseTasks?>(
      _taskRepository.tasks,
      onData: (_) => state.copyWith(tasks: _?.tasks?.lock),
    );
  }
}

final dashboardProvider =
    BlocProvider.autoDispose<DashboardBloc, DashboardState>(
  (ref) {
    return DashboardBloc(
      resolve(),
      resolve(),
    )
      ..add(const DashboardFetchUser())
      ..add(const DashboardFetchTasks());
  },
);
