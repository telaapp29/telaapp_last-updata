import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../../core/database/cash/cache_helper.dart';
import '../../../../core/database/sql.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_style.dart';
class GameMovementJump extends StatefulWidget {
  const GameMovementJump({super.key});

  @override
  State<GameMovementJump> createState() => _GameMovementJumpState();
}

class _GameMovementJumpState extends State<GameMovementJump> {
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
  int counterJump = 0;
  double jump = 0.0;
  int button1 = 0;
  var userId=getIt<CacheHelper>().getData(key: "login");
  var userType = getIt<CacheHelper>().getData(key: "loginTypeUser");
  var clothes = getIt<CacheHelper>().getData(
    key: "cloth",
  );
  Sql sql=Sql();
  int score=0;
  String text = "هيا لنقفز  معاً عشرة قفزات";
  int _seconds = 0;
  late Timer _timer;
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
    _timer=Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      setState(() {
        _seconds++;
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
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
                    counterWalk = jump;
                    if (counterJump == 0) {
                      textToSpeech(text, 'ar');
                    }
                    jump += 100;
                    if (jump > 100) {
                      counterJump++;
                      text = counterJump.toString();
                      textToSpeech(counterJump.toString(), 'ar');
                    }

                    if (jump >= height) {
                      jump = 0.0;
                      //counterJump=0;
                    }
                    if (counterJump >10) {
                      end = true;
                      begin = false;
                      text = "  لقد انجزنا مهمة القفز";
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
                tooltip: "Jump",
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
                    score=10;
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
                child: Text("$_seconds",style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(fontSize: 24,),),
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
                          scale: 2,
                        );
                      });
                    },
                    child: Center(
                      child: Stack(
                        children: [
                          Image.asset(
                            (userType == "Boy")
                                ? "assets/images/boy.png"
                                : "assets/images/girl.png",
                            width: 150,
                            height: 150,
                          ),
                          Positioned(
                              top: (userType == "Boy") ? 75 : 70,
                              right: (userType == "Boy") ? 5 : 7,
                              left: 3,
                              bottom: (userType == "Boy") ? 2 : 0,
                              child: Image.asset(
                                clothes,
                                width: 150,
                                height: 150,
                              )),
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
