import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ProfileDatasource {
  final ImagePicker _imagePicker = ImagePicker();

  Future<File?> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  Future<File?> pickImageFromCamera() async {
    final XFile? pickedFile =
        await _imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
