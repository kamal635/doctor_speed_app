String? validateConfirmPassword(
  String? value, {
  required String password,
  String message = 'Passwords do not match.',
}) {
  final confirmValue = value?.trimmedOrNull;
  final normalizedPassword = password.trimmedOrNull;

  if (confirmValue == null) {
    return null;
  }

  if (confirmValue != normalizedPassword) {
    return message;
  }

  return null;
}
