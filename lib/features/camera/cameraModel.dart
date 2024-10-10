

import 'dart:io';

class CameraModel{
  final File pickedFile;
  final String labelText;
  final String imageLabels ;

  CameraModel({required this.pickedFile, required this.labelText, required this.imageLabels});
}