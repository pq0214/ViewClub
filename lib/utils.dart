import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(
      source: source); // class in the photo manager package of dart

  if (_file != null) {
    return await _file.readAsBytes();
  }
}
