import 'package:doctor_speed_app/core/extensions/string_x.dart';

String? validateMinLength(String? value, {required int min, String? message}) {
  final trimmedValue = value?.trimmedOrNull;

  if (trimmedValue == null) {
    return null;
  }

  if (trimmedValue.length < min) {
    return message ?? 'Must be at least $min characters.';
  }

  return null;
}

String? validateMaxLength(String? value, {required int max, String? message}) {
  final trimmedValue = value?.trimmedOrNull;

  if (trimmedValue == null) {
    return null;
  }

  if (trimmedValue.length > max) {
    return message ?? 'Must be at most $max characters.';
  }

  return null;
}
