String? validateConfirmPassword(
  String? value, {
  required String password,
  String message = 'Passwords do not match.',
}) {
  final confirmValue = value?.trim() ?? '';

  if (confirmValue.isEmpty) {
    return null;
  }

  if (confirmValue != password.trim()) {
    return message;
  }

  return null;
}
