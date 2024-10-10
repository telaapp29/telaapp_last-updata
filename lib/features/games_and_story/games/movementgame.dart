import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

import '../../../core/database/cash/cache_helper.dart';
import '../../../core/services/service_locator.dart';
import '../../../core/utils/app_colors.dart';

class MovementGame extends StatefulWidget {
  const MovementGame({super.key});

  @override
  State<MovementGame> createState() => _MovementGameState();
}

class _MovementGameState extends State<MovementGame> {
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
  int counter = 0;
  int counterJump = 0;
  double jump = 0.0;
  double walk = 0.0;
  int button1 = 0;
  int button2 = 0;
  int button3 = 0;
  double counterRotate = 0.0;
  var userType = getIt<CacheHelper>().getData(key: "loginTypeUser");
  var clothes = getIt<CacheHelper>().getData(
    key: "cloth",
  );
  String text = "هيا لنمشي معاً مائة خطوة";
  int _seconds = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      setState(() {
        _seconds++;
      });
    });
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
            Padding(
              padding: const EdgeInsets.all(15),
              child: FloatingActionButton(
                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(() {
                    begin = true;
                    counterWalk = walk;
                    text = "هيا لنمشي معاً مائة خطوة";
                    if (counter == 0) {
                      textToSpeech(text, 'ar');
                    }
                    walk += 5;
                    if (walk >= 10) {
                      counter++;
                      text = counter.toString();
                      textToSpeech(counter.toString(), 'ar');
                    }
                    //textToSpeech(counter.toString(), 'ar');
                    if (walk >= height) {
                      walk = 0.0;
                      counter = 0;
                    }
                    if (counter == 99) {
                      end = true;
                      begin = false;
                      text = "  لقد انجزنا المهمة المشي";
                      button1 = 1;
                    }
                    print(walk);
                    print(counter);
                  });
                },
                child: Icon(
                  Icons.directions_walk,
                  size: 30,
                  color: AppColor.white,
                ),
                tooltip: "walk",
              ),
            ),
          if (button2 == 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 15, right: 15, left: 15),
              child: FloatingActionButton(
                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(() {
                    begin = true;
                    counterWalk = jump;
                    text = "هيا لنقفز  معاً خمسة خطوة";
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
                    if (counterJump >= 10) {
                      end = true;
                      begin = false;
                      text = "  لقد انجزنا المهمة القفز";
                      button2 = 1;
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
          if (button3 == 0)
            Padding(
              padding: const EdgeInsets.only(bottom: 25, right: 15, left: 15),
              child: FloatingActionButton(
                backgroundColor: AppColor.primaryColor.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                onPressed: () {
                  setState(() {
                    begin = true;
                    counterWalk = counterRotate;
                    text = "هيا لندور على مكاننا ";
                    if (counterRotate == 0) {
                      textToSpeech(text, 'ar');
                    }
                    counterRotate++;
                    if (counterRotate >= 10) {
                      end = true;
                      begin = false;
                      text = "  لقد انجزنا المهمة الدوران";
                      button3 = 1;
                    }
                    print(counterRotate);
                  });
                },
                child: Icon(
                  Icons.move_up_outlined,
                  size: 30,
                  color: AppColor.white,
                ),
                tooltip: "movement",
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: (end && begin == false)
            ? Center(child: Container(
          alignment: Alignment.center,
          width: 180,
            height: 50,
            decoration: BoxDecoration(
                color: AppColor.primaryColor.withOpacity(0.8),
                borderRadius: BorderRadius.circular(15)),
            child: Text(text,)))
            : Container(
                margin: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: AppColor.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 180,
                        height: 40,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(text)),
                    Text("$_seconds"),
                    Transform.rotate(
                      angle: counterRotate,
                      child: Transform.translate(
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
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
