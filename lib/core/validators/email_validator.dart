final _emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

String? validateEmail(
  String? value, {
  String message = 'Please enter a valid email address.',
}) {
  final trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return null;
  }

  if (!_emailRegex.hasMatch(trimmedValue)) {
    return message;
  }

  return null;
}
