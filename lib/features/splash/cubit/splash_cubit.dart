// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:riverbloc/riverbloc.dart';

// Project imports:
import 'package:shift_planner/app/injection/injection.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this._authenticationRepository) : super(SplashInitial());

  final AuthenticationRepository _authenticationRepository;

  void onCheckForUser() {
    final user = _authenticationRepository.currentUser;

    if (user == User.empty) {
      // navigate to register
    } else {
      // go home
    }
  }
}

final splashProvider = BlocProvider<SplashCubit, SplashState>(
  (ref) {
    final authenticationRepository = resolve<AuthenticationRepository>();

    return SplashCubit(authenticationRepository);
  },
);
