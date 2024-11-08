import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../../core/database/cash/cache_helper.dart';
import '../../../../core/database/sql.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
class GameMovementRotate extends StatefulWidget {
  const GameMovementRotate({super.key});

  @override
  State<GameMovementRotate> createState() => _GameMovementRotateState();
}

class _GameMovementRotateState extends State<GameMovementRotate> {
  FlutterTts flutterTts = FlutterTts();

  void textToSpeech(String text, String languge) async {
    await flutterTts.setLanguage(languge);
    await flutterTts.setVolume(0.5);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(1);
    await flutterTts.speak(text);
  }

  double counterWalk = 0.0;
  bool begin = false;
  bool end = false;
  bool replace=true;
  bool st=false;
  int counterJump = 0;
  double jump = 0.0;
  int d=0;
  int button1 = 0;
  var userId=getIt<CacheHelper>().getData(key: "login");
  var userType = getIt<CacheHelper>().getData(key: "loginTypeUser");
  var clothes = getIt<CacheHelper>().getData(
    key: "cloth",
  );
  Sql sql=Sql();
  int score=0;
  String text = "هيا لنبداء  التمرين  معا";
  readUserScore()async{
    var response=await sql.readUserScore(userId);
    if(response == true){
      setState(() {
        print(sql.score);
      });
    }else{
      return 0;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 320;
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(0.9),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          if (button1 == 0)
            Container(
              width: 80,
              height: 80,
              margin: const EdgeInsets.all(30),
              child: FloatingActionButton(
                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(() {
                    readUserScore();
                    begin = true;
                    // counterWalk = jump;
                    if (counterJump == 0) {
                      textToSpeech(text, 'ar');
                    }
                    jump += 100;
                    if (jump > 100) {
                      st=true;
                      replace=!replace;
                      counterJump++;
                      text = counterJump.toString();
                      textToSpeech(counterJump.toString(), 'ar');
                    }

                    if (counterJump >20 ) {
                      end = true;
                      begin = false;
                      text = "  لقد انجزنا المهمة ";
                      counterJump-=1;
                      textToSpeech(text, 'ar');
                      button1 = 1;

                    }
                    print(counterWalk);
                    print(counterJump);
                  });
                },
                child: Icon(
                  Icons.nordic_walking_rounded,
                  size: 30,
                  color: AppColor.white,
                ),
                tooltip: "ex3",
              ),
            ),
          if(button1==1)
            SizedBox(
              width: 110,
              height:110 ,
              child: FloatingActionButton(

                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(() {
                    score=100;
                    sql.updateData(
                        "update UserInformation set score='${sql.score+score}' where user_id ='${userId}'");
                    Navigator.of(context).pop(score);
                  });
                },
                child: Icon(
                  Icons.exit_to_app_outlined,
                  size: 80,
                  color: AppColor.white,
                ),
              ),
            ),

        ],
      ),
      body: SafeArea(
        child: (end && begin == false)
            ?  Center(
            child: Container(
                alignment: Alignment.center,
                width: 350,
                height: 120,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  text,
                  style: CustomTextStyles.Merriweather100style90.copyWith(color: AppColor.white.withOpacity(0.9),fontSize: 30),
                )))
            : Container(
          margin: EdgeInsets.all(25),
          decoration: BoxDecoration(
              color: AppColor.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 300,
                height: 60,
                alignment: Alignment.center,
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: AppColor.primaryColor.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10)),
                child: Text(text,style: CustomTextStyles.Interstyle25.copyWith(color: AppColor.white)),),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
              ),
              Transform.translate(
                  offset: Offset(
                    0.0,
                    counterWalk,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        Transform.scale(
                          scale: 3,
                        );
                      });
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(
                            (true)
                                ?((st)? ((replace)?"assets/images/8.jpg": "assets/images/9.jpg"):"assets/images/7.jpg" )
                                :"",
                            width: 280,
                            height: 200,
                          ),
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
