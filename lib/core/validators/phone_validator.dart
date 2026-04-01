import 'package:doctor_speed_app/core/extensions/string_x.dart';

final _phoneRegex = RegExp(r'^(?:\+963|0)9\d{8}$');

String? validatePhone(
  String? value, {
  String message = 'Please enter a valid phone number.',
}) {
  final trimmedValue = value?.trimmedOrNull;

  if (trimmedValue == null) {
    return null;
  }

  if (!_phoneRegex.hasMatch(trimmedValue)) {
    return message;
  }

  return null;
}
