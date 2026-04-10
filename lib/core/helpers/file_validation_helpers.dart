import 'package:doctor_speed_app/core/extensions/string_x.dart';

/// Extracts the file extension in lowercase.
/// Returns null if the file name is empty or has no valid extension.
String? normalizeFileExtension(String? fileName) {
  final value = fileName?.trimmedOrNull;
  if (value == null) return null;

  final lastDotIndex = value.lastIndexOf('.');
  if (lastDotIndex == -1 || lastDotIndex == value.length - 1) {
    return null;
  }

  return value.substring(lastDotIndex + 1).toLowerCase();
}

// -----------------------------------------------------------------------------
// Extension checks
// -----------------------------------------------------------------------------

/// Returns true if the file extension is in the allowed list.
bool hasAllowedExtension(
  String? fileName, {
  required List<String> allowedExtensions,
}) {
  final extension = normalizeFileExtension(fileName);
  if (extension == null) return false;

  final normalizedAllowed = allowedExtensions
      .map((e) => e.toLowerCase())
      .toSet();

  return normalizedAllowed.contains(extension);
}

/// Returns true if the file is a PDF.
bool isPdfFile(String? fileName) {
  return hasAllowedExtension(fileName, allowedExtensions: const ['pdf']);
}

/// Returns true if the file is a supported image type.
bool isImageFile(String? fileName) {
  return hasAllowedExtension(
    fileName,
    allowedExtensions: const ['jpg', 'jpeg', 'png', 'webp'],
  );
}

// -----------------------------------------------------------------------------
// Size checks
// -----------------------------------------------------------------------------

/// Returns true if the file size does not exceed the allowed maximum.
bool isWithinMaxFileSize(
  int fileSizeInBytes, {
  required int maxFileSizeInBytes,
}) {
  return fileSizeInBytes <= maxFileSizeInBytes;
}
