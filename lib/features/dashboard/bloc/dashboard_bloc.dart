// Dart imports:
import 'dart:async';

// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:formz/formz.dart';
import 'package:riverbloc/riverbloc.dart';
import 'package:task_repository/task_repository.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';
import 'package:shift_planner/app/injection/injection.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this._authenticationRepository,
    this._taskRepository,
    this._router,
  ) : super(const DashboardState()) {
    on<DashboardFetchUser>(_onFetchUser);
    on<DashboardFetchTasks>(_onFetchTasks);
    on<DashboardLogout>(_onLogout);
    on<DashboardDeleteTask>(_onDeleteTask);
  }

  final AuthenticationRepository _authenticationRepository;
  final ITaskRepository _taskRepository;
  final AppRouter _router;

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
      onError: (e, s) => state.copyWith(
        status: FormzStatus.submissionFailure,
        error: e.toString(),
      ),
    );
  }

  FutureOr<void> _onLogout(
    DashboardLogout event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final response = await _authenticationRepository.logOut().run();

    response.match(
      (l) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, error: l));
      },
      (r) {
        _router.replaceAll(const [LoginRoute()]);
      },
    );
  }

  FutureOr<void> _onDeleteTask(
    DashboardDeleteTask event,
    Emitter<DashboardState> emit,
  ) async {
    final response = await _taskRepository.deleteTask(event.task).run();

    response.match(
      (l) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, error: l));
      },
      (r) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      },
    );
  }
}

final dashboardProvider =
    BlocProvider.autoDispose<DashboardBloc, DashboardState>(
  (ref) {
    return DashboardBloc(
      resolve(),
      resolve(),
      resolve(),
    )
      ..add(const DashboardFetchUser())
      ..add(const DashboardFetchTasks());
  },
);
