import 'package:image_picker/image_picker.dart';

class FilePickerService {
  final ImagePicker _picker = ImagePicker();

  Future<XFile?> pickFromGallery() async {
    return await _picker.pickImage(
      source: ImageSource.gallery,
    );
  }
}
