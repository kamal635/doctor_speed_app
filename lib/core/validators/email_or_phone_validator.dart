import 'email_validator.dart';
import 'phone_validator.dart';

String? validateEmailOrPhone(
  String? value, {
  String message = 'Please enter a valid email address or phone number.',
}) {
  final trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return null;
  }

  final emailError = validateEmail(trimmedValue, message: message);

  if (emailError == null) {
    return null;
  }

  final phoneError = validatePhone(trimmedValue, message: message);

  if (phoneError == null) {
    return null;
  }

  return message;
}
