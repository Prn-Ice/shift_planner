// Package imports:
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:riverbloc/riverbloc.dart';

// Project imports:
import 'package:shift_planner/app/app.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(
    this._authenticationRepository,
    this._router,
  ) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;
  final AppRouter _router;

  void onEmailChanged(String val) {
    final email = EmailInput.dirty(val);
    final status = Formz.validate([email, state.password]);

    emit(state.copyWith(email: email, status: status));
  }

  void onPasswordChanged(String val) {
    final password = GeneralInput.dirty(val);
    final status = Formz.validate([state.email, password]);

    emit(state.copyWith(password: password, status: status));
  }

  Future<void> onLogin() async {
    final email = state.email.value;
    final password = state.password.value;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    final response = await _authenticationRepository
        .logInWithEmailAndPassword(email: email, password: password)
        .run();

    response.match(
      (l) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, error: l));
        Future<void>.delayed(const Duration(seconds: 1)).then((value) {
          emit(state.copyWith(status: FormzStatus.valid));
        });
      },
      (r) {
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
        _router.replaceAll([const DashboardRoute()]);
      },
    );
  }
}

final loginProvider = BlocProvider.autoDispose<LoginCubit, LoginState>(
  (ref) {
    return LoginCubit(resolve(), resolve());
  },
);
