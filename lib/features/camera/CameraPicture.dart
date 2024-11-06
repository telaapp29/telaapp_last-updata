


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';
import 'package:translator/translator.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import '../../core/Functions/functions.dart';
import '../../core/widgets/custom_btn.dart';
import 'cameraModel.dart';

class CameraPicture extends StatefulWidget {
  final CameraModel cameraModel;

  CameraPicture({super.key, required this.cameraModel});

  @override
  State<CameraPicture> createState() => _CameraPictureState();
}

class _CameraPictureState extends State<CameraPicture> {
  final FlutterTts flutterTts = FlutterTts();
  final GoogleTranslator translator = GoogleTranslator();

  String imageLabels = '';
  File? _pickedImage;
  String nameOfImage = "Chair";
  String nameOfImageAr = "";
  String descriptionOfImage = "This is used for ";
  String descriptionOfImageAr = "";
  String labelText = "";

  @override
  void initState() {
    super.initState();
    nameOfImage = widget.cameraModel.labelText;
    descriptionOfImage += widget.cameraModel.imageLabels;
    _pickedImage = widget.cameraModel.pickedFile;
    translateTexts();
    checkLanguages();
  }

  // دالة للتحقق من اللغات المتاحة ومعرفة إذا كانت اللغة العربية مدعومة
  void checkLanguages() async {
    List<dynamic> languages = await flutterTts.getLanguages;
    print("Available languages: $languages");
    if (!languages.contains("ar")) {
      print("Arabic language is not supported on this device.");
    }
  }

  Future<void> translateTexts() async {
    try {
      final nameTranslation = await translator.translate(nameOfImage, to: 'ar');
      final descriptionTranslation = await translator.translate(descriptionOfImage, to: 'ar');
      setState(() {
        nameOfImageAr = nameTranslation.text;
        descriptionOfImageAr = descriptionTranslation.text;
      });
    } catch (e) {
      print("Translation error: $e");
    }
  }

  void textToSpeech(String text, String language) async {
    List<dynamic> languages = await flutterTts.getLanguages;
    if (!languages.contains(language)) {
      print("The selected language is not supported on this device.");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("اللغة العربية غير مدعومة على هذا الجهاز")),
      );
      return;
    }

    await flutterTts.setLanguage(language);
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 27, left: 5, right: 30),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 40,
                        color: AppColor.black,
                      ),
                      onPressed: () {
                        customRemoveNavigate(context);
                      },
                    ),
                    Expanded(
                      child: _pickedImage == null
                          ? const Center(child: Text("No image selected"))
                          : Image.file(_pickedImage!),
                    ),
                  ],
                ),
              ),

              Column(

                children: [
                  SizedBox(width: 20,height: 20,),
                  CustomBtn(
                    text: nameOfImageAr,
                    color: AppColor.purple,
                    onPressed: () => textToSpeech(nameOfImageAr, 'ar'),
                    width: 300,
                    height: 70,
                    style: CustomTextStyles.Merriweather100style90.copyWith(color: AppColor.white, fontSize: 20),
                  ),
                  SizedBox(width: 20,height: 20,),

                  InkWell(
                    onTap: () => textToSpeech(descriptionOfImageAr, 'ar'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 50),
                      width: 400,
                      height: 20,
                      child: Text(
                        descriptionOfImageAr,
                        textDirection: TextDirection.ltr,
                        style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(color: AppColor.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,height: 20,),

                  CustomBtn(
                    text: nameOfImage,
                    color: AppColor.cyan2,
                    onPressed: () => textToSpeech(nameOfImage, 'en-US'),
                    width: 200,
                    height: 70,
                    style: CustomTextStyles.Merriweather100style90.copyWith(color: AppColor.white, fontSize: 20),
                  ),
                  SizedBox(width: 20,height: 20,),

                  InkWell(
                    onTap: () => textToSpeech(descriptionOfImage, 'en-US'),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      width: 400,
                      height: 20,
                      child: Text(
                        descriptionOfImage,
                        style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(color: AppColor.black, fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 20,height: 20,),
                  CustomBtn(
                    text: "Take Picture...",
                    onPressed: () => pickImage(ImageSource.camera),
                    width: 320,
                    height: 50,
                  ),
                  SizedBox(width: 20,height: 70,),

                  CustomBtn(
                    text: "",
                    width: 90,
                    height: 55,
                    onPressed: () {
                      customRemoveNavigate(context);
                    },
                  ).customButton(
                    const Icon(Icons.home_outlined, size: 60, color: AppColor.black),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile == null) return;
    await getImageLabels(pickedFile);
    setState(() {
      _pickedImage = File(pickedFile.path);
    });
  }

  Future<void> getImageLabels(XFile image) async {
    final inputImage = InputImage.fromFilePath(image.path);
    final imageLabeler = ImageLabeler(options: ImageLabelerOptions());
    final labels = await imageLabeler.processImage(inputImage);

    setState(() {
      imageLabels = labels.map((label) => label.label).join(" and ");
    });
    imageLabeler.close();
  }
}
