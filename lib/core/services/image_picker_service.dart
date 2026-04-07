import 'package:image_picker/image_picker.dart';

enum AppImageSource { camera, gallery }

class ImagePickerService {
  ImagePickerService({ImagePicker? picker}) : _picker = picker ?? ImagePicker();

  final ImagePicker _picker;

  Future<XFile?> pickImage({
    required AppImageSource source,
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) {
    return _picker.pickImage(
      source: switch (source) {
        AppImageSource.camera => ImageSource.camera,
        AppImageSource.gallery => ImageSource.gallery,
      },
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  Future<XFile?> pickFromCamera({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) {
    return pickImage(
      source: AppImageSource.camera,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }

  Future<XFile?> pickFromGallery({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) {
    return pickImage(
      source: AppImageSource.gallery,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );
  }
}
