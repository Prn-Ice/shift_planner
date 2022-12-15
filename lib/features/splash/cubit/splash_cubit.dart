// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:riverbloc/riverbloc.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(
    this._authenticationRepository,
    this._router,
  ) : super(SplashInitial());

  final AuthenticationRepository _authenticationRepository;
  final AppRouter _router;

  void onCheckForUser() {
    final user = _authenticationRepository.currentUser;

    if (user == User.empty) {
      _router.replace(const RegisterRoute());
    } else {
      _router.replace(const DashboardRoute());
    }
  }
}

final splashProvider = BlocProvider<SplashCubit, SplashState>(
  (ref) {
    return SplashCubit(
      resolve<AuthenticationRepository>(),
      resolve<AppRouter>(),
    );
  },
);
