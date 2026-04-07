String? normalizeFileExtension(String? fileName) {
  if (fileName == null || fileName.trim().isEmpty) return null;

  final lastDotIndex = fileName.lastIndexOf('.');
  if (lastDotIndex == -1 || lastDotIndex == fileName.length - 1) {
    return null;
  }

  return fileName.substring(lastDotIndex + 1).toLowerCase();
}

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

bool isWithinMaxFileSize(
  int fileSizeInBytes, {
  required int maxFileSizeInBytes,
}) {
  return fileSizeInBytes <= maxFileSizeInBytes;
}

bool isPdfFile(String? fileName) {
  return hasAllowedExtension(fileName, allowedExtensions: const ['pdf']);
}

bool isImageFile(String? fileName) {
  return hasAllowedExtension(
    fileName,
    allowedExtensions: const ['jpg', 'jpeg', 'png', 'webp'],
  );
}
