import 'dart:convert';
import 'dart:io';

class ImageHandler {
  static toBytes(String path) {
    var imageFile = File(path);
    String base64Image = base64Encode(imageFile.readAsBytesSync());

    return (base64Image);
  }
}
