// Dart imports:
import 'dart:async';

// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:riverbloc/riverbloc.dart';

// Project imports:
import 'package:shift_planner/app/injection/injection.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this._authenticationRepository)
      : super(const DashboardState()) {
    on<DashboardFetchUser>(_onFetchUser);
  }

  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> _onFetchUser(
    DashboardFetchUser event,
    Emitter<DashboardState> emit,
  ) {
    final user = _authenticationRepository.currentUser;

    emit(state.copyWith(user: user));
  }
}

final dashboardProvider =
    BlocProvider.autoDispose<DashboardBloc, DashboardState>(
  (ref) {
    return DashboardBloc(resolve())..add(const DashboardFetchUser());
  },
);
