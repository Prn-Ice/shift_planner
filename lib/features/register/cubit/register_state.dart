part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
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

  RegisterState copyWith({
    EmailInput? email,
    GeneralInput? password,
    FormzStatus? status,
    String? error,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
