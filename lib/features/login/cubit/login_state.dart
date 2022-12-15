part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const EmailInput.pure(),
    this.password = const GeneralInput.pure(),
    this.error = '',
    this.status = FormzStatus.pure,
  });

  final EmailInput email;
  final GeneralInput password;
  final FormzStatus status;
  final String error;

  @override
  List<Object> get props => [email, password, status, error];

  LoginState copyWith({
    EmailInput? email,
    GeneralInput? password,
    FormzStatus? status,
    String? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
