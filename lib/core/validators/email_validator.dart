import 'package:doctor_speed_app/core/extensions/string_x.dart';

final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

String? validateEmail(
  String? value, {
  String message = 'Please enter a valid email address.',
}) {
  final trimmedValue = value?.trimmedOrNull;

  if (trimmedValue == null) {
    return null;
  }

  if (!_emailRegex.hasMatch(trimmedValue)) {
    return message;
  }

  return null;
}
