// Package imports:
import 'package:formz/formz.dart';

class GeneralInput extends FormzInput<String, GeneralInputError> {
  const GeneralInput.pure() : super.pure('');
  const GeneralInput.dirty([super.value = '']) : super.dirty();

  @override
  GeneralInputError? validator(String? value) {
    return value?.isNotEmpty ?? false ? null : GeneralInputError.invalid;
  }
}

enum GeneralInputError { invalid }

extension GeneralInputErrorDescription on GeneralInput {
  String? get errorText {
    if (invalid && error == GeneralInputError.invalid) {
      return '';
    }

    return null;
  }
}
