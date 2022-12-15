// Package imports:
import 'package:formz/formz.dart';
import 'package:validators/validators.dart';

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty([super.value = '']) : super.dirty();

  @override
  EmailInputError? validator(String? value) {
    return isEmail(value ?? '') ? null : EmailInputError.invalid;
  }
}

enum EmailInputError { invalid }

extension EmailInputErrorDescription on EmailInput {
  String? get errorText {
    if (invalid && error == EmailInputError.invalid) {
      return '';
    }

    return null;
  }
}
