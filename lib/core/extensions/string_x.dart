extension StringX on String {
  bool get isBlank => trim().isEmpty;

  bool get isNotBlank => trim().isNotEmpty;

  String? get trimmedOrNull {
    final value = trim();
    return value.isEmpty ? null : value;
  }

  String get digitsOnly => replaceAll(RegExp(r'\D'), '');

  String get normalizedSpaces => trim().replaceAll(RegExp(r'\s+'), ' ');
}
