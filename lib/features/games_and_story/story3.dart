import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:telaproject/core/database/sql.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import 'package:telaproject/features/games_and_story/model/storymodel.dart';
import 'package:translator/translator.dart';

import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';

class Story3 extends StatefulWidget {
  Story3({super.key, required this.storyModel});

  StoryModel storyModel;

  @override
  State<Story3> createState() => _StoryState();
}


class _StoryState extends State<Story3> {
  Sql sql = Sql();
  FlutterTts flutterTts = FlutterTts();
  GoogleTranslator translator = GoogleTranslator();
  String title = "";
  String textStory1="",textStory2="",textStory3="",textStory4="",textStory5="",textStory6="",textStory7="",textStory8="",textStory9="",textStory10="",textStory11="",textStory12="",textStory13="",textStory14="",textStory15="",textStory16="",textStory17="",textStory18="",textStory19="",textStory20="",textStory21="",textStory22="";


  void textToSpeech(String text, String languge) async {
    await flutterTts.setLanguage(languge);
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  void stop() async {
    await flutterTts.stop();
  }

  String translateNameofStory() {
    translator
        .translate(widget.storyModel.title, to: 'ar', from: 'en')
        .then((result) {
      title = result.toString();
      print(title);
    });
    return title;
  }

  String translateTextOf1Story(String text) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory1 = result.toString();
      print(textStory1);
    });
    return textStory1;
  }

  String translateTextOf2Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory2 = result.toString();
      print(textStory2);
    });
    return textStory2;
  }
  String translateTextOf3Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory3= result.toString();
      print(textStory3);
    });
    return textStory3;
  }
  String translateTextOf4Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory4 = result.toString();
      print(textStory4);
    });
    return textStory4;
  }
  String translateTextOf5Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory5 = result.toString();
      print(textStory5);
    });
    return textStory5;
  }
  String translateTextOf6Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory6 = result.toString();
      print(textStory6);
    });
    return textStory6;
  }
  String translateTextOf7Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory7 = result.toString();
      print(textStory7);
    });
    return textStory7;
  }
  String translateTextOf8Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory8 = result.toString();
      print(textStory8);
    });
    return textStory8;
  }
  String translateTextOf9Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory9 = result.toString();
      print(textStory9);
    });
    return textStory9;
  }
  String translateTextOf10Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory10 = result.toString();
      print(textStory10);
    });
    return textStory10;
  }
  String translateTextOf11Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory11 = result.toString();
      print(textStory11);
    });
    return textStory11;
  }
  String translateTextOf12Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory12 = result.toString();
      print(textStory12);
    });
    return textStory12;
  }
  String translateTextOf13Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory13 = result.toString();
      print(textStory13);
    });
    return textStory13;
  }
  String translateTextOf14Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory14 = result.toString();
      print(textStory14);
    });
    return textStory14;
  }
  String translateTextOf15Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory15 = result.toString();
      print(textStory15);
    });
    return textStory15;
  }
  String translateTextOf16Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory16 = result.toString();
      print(textStory16);
    });
    return textStory16;
  }
  String translateTextOf17Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory17 = result.toString();
      print(textStory17);
    });
    return textStory17;
  }
  String translateTextOf18Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory18 = result.toString();
      print(textStory18);
    });
    return textStory18;
  }
  String translateTextOf19Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory19= result.toString();
      print(textStory19);
    });
    return textStory19;
  }
  String translateTextOf20Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory20 = result.toString();
      print(textStory20);
    });
    return textStory20;
  }
  String translateTextOf21Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory21 = result.toString();
      print(textStory21);
    });
    return textStory21;
  }
  String translateTextOf22Story(String text,) {
    translator
        .translate(text, to: 'ar', from: 'en')
        .then((result) {
      textStory22 = result.toString();
      print(textStory22);
    });
    return textStory22;
  }
    bool onpressed = false;
  int counter = 0;
  int currentIndex = 0;
Widget tStory(String textStoryArabic,String ttStory)=>Container(
  margin: EdgeInsets.only(top: 20, bottom: 20),
  padding: const EdgeInsets.symmetric(
      horizontal: 20, vertical: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppColor.white3,
  ),
  child: GestureDetector(
    onTap: () {
      setState(() {
        if (onpressed == true) {
          textToSpeech(textStoryArabic, 'ar-SA');
        } else {
          textToSpeech(ttStory, 'en-US');
        }
      });
    },
    child: Text(
      (onpressed == true)
          ? textStoryArabic
          : ttStory,
      style: CustomTextStyles.Merriweatherstyle15,
    ),
  ),
);
Widget ImageStory(String image)=> Container(
  width: MediaQuery.of(context).size.width,
  height: MediaQuery.of(context).size.height / 3,
  margin: EdgeInsets.only(top: 20),
  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: AppColor.white,
  ),
  child: ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset(
          "assets/images/${image}",
          fit: BoxFit.cover)),
);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    var userId = getIt<CacheHelper>().getData(key: "login");
    String nameOfStory = translateNameofStory();
    String text1=translateTextOf1Story(widget.storyModel.textStory[0]);
    String text2=translateTextOf2Story(widget.storyModel.textStory[1]);
    String text3=translateTextOf3Story(widget.storyModel.textStory[2]);
    String text4=translateTextOf4Story(widget.storyModel.textStory[3]);
    String text5=translateTextOf5Story(widget.storyModel.textStory[4]);
    String text6=translateTextOf6Story(widget.storyModel.textStory[5]);
    String text7=translateTextOf7Story(widget.storyModel.textStory[6]);
    String text8=translateTextOf8Story(widget.storyModel.textStory[7]);
    String text9=translateTextOf9Story(widget.storyModel.textStory[8]);
    String text10=translateTextOf10Story(widget.storyModel.textStory[9]);
    String text11=translateTextOf11Story(widget.storyModel.textStory[10]);
    String text22=translateTextOf22Story("The End");



    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.primaryColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white3,
                          ),
                          child: IconButton(
                              onPressed: () {
                                stop();
                              },
                              icon: Icon(Icons.stop))),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white3,
                          ),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  if (currentIndex >= widget.storyModel.textStory.length) {
                                    currentIndex = 0;
                                  }
                                  currentIndex++;
                                  print(currentIndex);
                                  if (onpressed == true) {
                                     // textToSpeech('${'${text}${currentIndex}'}','ar');
                                  } else {
                                    if (currentIndex == 1) {
                                      textToSpeech(
                                          widget.storyModel.title, 'en-US');
                                    } else {
                                      textToSpeech(
                                          widget.storyModel.textStory[currentIndex-2], 'en-US');
                                    }
                                  }
                                });
                              },
                              icon: Icon(Icons.mic))),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColor.white3,
                          ),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  onpressed = !onpressed;
                                  print(onpressed);
                                });
                              },
                              icon: Icon(Icons.translate))),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: IconButton(
                          onPressed: () {
                            final result = sql.insertData(
                                'INSERT INTO History(name_of_content,user_id) VALUES("${widget.storyModel.title}", "${userId}")');
                            if (result != null) {
                              customRemoveNavigate(context);
                              print("Inserted data");
                            } else {
                              print("no inserted ");
                            }
                            stop();
                          },
                          icon: Icon(Icons.arrow_back_ios),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColor.white3,
                        ),
                      ),
                      Container(
                        width: 220,
                        margin: EdgeInsets.only(right: 50, top: 20),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (onpressed == true) {
                                textToSpeech(nameOfStory, 'ar');
                              } else {
                                textToSpeech(widget.storyModel.title, 'en-US');
                              }
                            });
                          },
                          child: Text(
                            (onpressed == true)
                                ? nameOfStory
                                : widget.storyModel.title,
                            style:
                                CustomTextStyles.Merriweatherstyle15.copyWith(
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white3,
                        ),
                      ),
                    ],
                  ),
                  ImageStory(widget.storyModel.imageStory[0]),
                  tStory(text1,widget.storyModel.textStory[0]),
                  ImageStory(widget.storyModel.imageStory[1]),
                  tStory(text1,widget.storyModel.textStory[1]),
                  ImageStory(widget.storyModel.imageStory[2]),
                  tStory(text1,widget.storyModel.textStory[2]),
                  ImageStory(widget.storyModel.imageStory[3]),
                  tStory(text1,widget.storyModel.textStory[3]),
                  ImageStory(widget.storyModel.imageStory[4]),
                  tStory(text1,widget.storyModel.textStory[4]),
                  ImageStory(widget.storyModel.imageStory[5]),
                  tStory(text1,widget.storyModel.textStory[5]),
                  ImageStory(widget.storyModel.imageStory[6]),
                  tStory(text1,widget.storyModel.textStory[6]),
                  ImageStory(widget.storyModel.imageStory[7]),
                  tStory(text1,widget.storyModel.textStory[7]),
                  ImageStory(widget.storyModel.imageStory[8]),
                  tStory(text1,widget.storyModel.textStory[8]),
                  ImageStory(widget.storyModel.imageStory[9]),
                  tStory(text1,widget.storyModel.textStory[9]),
                  ImageStory(widget.storyModel.imageStory[10]),
                  tStory(text1,widget.storyModel.textStory[10]),
                  ImageStory(widget.storyModel.imageStory[11]),
                  tStory(text1,widget.storyModel.textStory[11]),
                  ImageStory(widget.storyModel.imageStory[12]),
                  tStory(text1,widget.storyModel.textStory[12]),
                  ImageStory(widget.storyModel.imageStory[13]),
                  tStory(text1,widget.storyModel.textStory[13]),
                  ImageStory(widget.storyModel.imageStory[14]),
                  tStory(text1,widget.storyModel.textStory[14]),
                  ImageStory(widget.storyModel.imageStory[15]),
                  tStory(text1,widget.storyModel.textStory[15]),
                  ImageStory(widget.storyModel.imageStory[16]),
                  tStory(text1,widget.storyModel.textStory[16]),
                  ImageStory(widget.storyModel.imageStory[17]),
                  tStory(text1,widget.storyModel.textStory[17]),
                  ImageStory(widget.storyModel.imageStory[18]),
                  tStory(text1,widget.storyModel.textStory[18]),
                  ImageStory(widget.storyModel.imageStory[19]),
                  tStory(text1,widget.storyModel.textStory[19]),
                  ImageStory(widget.storyModel.imageStory[20]),

                  tStory(text22,"The End"),

                ],
              ),
            ),
          )),
    );
  }
}
