import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FetchImage {
  FetchImage._();

  static Future<File?> pickImage(ImageSource source) async {
    try {
      XFile? pickedFile;

      if (source == ImageSource.camera) {
        pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
      } else if (source == ImageSource.gallery) {
        pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      }

      if (pickedFile != null) {
        return File(pickedFile.path);
      }

      return null;
    } catch (e) {
      rethrow;
    }
  }
}
