import 'package:doctor_speed_app/core/extensions/string_x.dart';

String? validateRequired(
  String? value, {
  String message = 'This field is required.',
}) {
  if (value?.trimmedOrNull == null) {
    return message;
  }

  return null;
}
