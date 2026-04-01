import 'package:doctor_speed_app/core/extensions/string_x.dart';

String? validateConfirmPassword(
  String? value, {
  required String password,
  String message = 'Passwords do not match.',
}) {
  final normalizedPassword = password.trimmedOrNull;
  final confirmValue = value?.trimmedOrNull;

  if (confirmValue == null) {
    return null;
  }

  if (confirmValue != normalizedPassword) {
    return message;
  }

  return null;
}
