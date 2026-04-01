String? validateRequired(
  String? value, {
  String message = 'This field is required.',
}) {
  if (value == null || value.trim().isEmpty) {
    return message;
  }

  return null;
}
