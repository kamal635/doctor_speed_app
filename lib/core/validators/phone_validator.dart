final _phoneRegex = RegExp(r'^(?:\+963|0)9\d{8}$');

String? validatePhone(
  String? value, {
  String message = 'Please enter a valid phone number.',
}) {
  final trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return null;
  }

  if (!_phoneRegex.hasMatch(trimmedValue)) {
    return message;
  }

  return null;
}
