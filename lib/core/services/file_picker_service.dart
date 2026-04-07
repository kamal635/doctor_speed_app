import 'package:file_picker/file_picker.dart';

class FilePickerService {
  const FilePickerService();

  Future<FilePickerResult?> pickFile({
    FileType type = FileType.any,
    List<String>? allowedExtensions,
    bool withData = false,
  }) {
    return FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: type,
      allowedExtensions: allowedExtensions,
      withData: withData,
    );
  }

  Future<FilePickerResult?> pickPdf() {
    return pickFile(type: FileType.custom, allowedExtensions: ['pdf']);
  }
}
