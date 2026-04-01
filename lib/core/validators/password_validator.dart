String? validatePassword(
  String? value, {
  String message =
      'Password must be at least 8 characters, include letters and numbers, and contain no spaces.',
}) {
  final trimmedValue = value?.trim() ?? '';

  if (trimmedValue.isEmpty) {
    return null;
  }

  final hasMinLength = trimmedValue.length >= 8;
  final hasLetter = RegExp(r'[A-Za-z]').hasMatch(trimmedValue);
  final hasDigit = RegExp(r'\d').hasMatch(trimmedValue);
  final hasNoSpaces = !RegExp(r'\s').hasMatch(trimmedValue);

  if (!hasMinLength || !hasLetter || !hasDigit || !hasNoSpaces) {
    return message;
  }

  return null;
}
