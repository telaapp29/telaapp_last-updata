import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import 'package:telaproject/features/camera/cameraModel.dart';
import '../../../core/Functions/functions.dart';
class Games extends StatefulWidget {
Games(
      {super.key,
        this.com=false,
      required this.text,
      required this.image,
      required this.containerColor1,
      required this.containerColor2,
      required this.path});

  final String text;
  final String image;
  final Color containerColor1;
  final Color containerColor2;
  final String path;
  bool com;

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  File? _pickedImage;
  String labelText="";
  String imageLabels = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 33, right: 44, bottom: 39),
      child: GestureDetector(
        onTap: () {
          if(widget.com==true){
          setState(() {
            pickImage(ImageSource.camera);
          });
            if(_pickedImage!=null){

            }
          }
          else{
            customNavigate(context, widget.path);
          }

        },
        child: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: widget.containerColor1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60, top: 20),
                      child: Text(
                        widget.text,
                        style: CustomTextStyles.Interstyle25.copyWith(
                            fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: widget.containerColor2,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
                top: 3,
                left: -10,
                bottom: 2,
                child: Image.asset(
                  widget.image,
                  width: 130,
                  height: 130,
                )),
          ],
        ),
      ),
    );
  }
  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    getImageLabels(pickedFile);
    setState(() {
      _pickedImage = File(pickedFile.path);
      if(_pickedImage!=null ){
        print(_pickedImage);
      }
    });
  }
  Future<void> getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    ImageLabeler imageLabeler =
    ImageLabeler(options: ImageLabelerOptions());
    List<ImageLabel> labels = await imageLabeler.processImage(inputImage);

    StringBuffer sb = StringBuffer();
    for (ImageLabel imageLabel in labels) {
      labelText = imageLabel.label;
      sb.write(labelText);
      sb.write(" and ");
    }
    imageLabeler.close();
    imageLabels = sb.toString();
    setState(() {
      print("ff$labelText");
      GoRouter.of(context).push('/CameraPicture',extra:CameraModel(pickedFile: _pickedImage!, labelText: labelText, imageLabels: imageLabels));
    });
  }
}


