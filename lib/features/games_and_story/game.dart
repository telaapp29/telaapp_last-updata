import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import 'package:telaproject/features/Home/HomePage.dart';
import 'package:telaproject/features/games_and_story/games/Arabic_fill_word.dart';
import 'package:telaproject/features/games_and_story/games/english_fill_word.dart';
import 'package:telaproject/features/games_and_story/games/expertion_math.dart';
import 'package:telaproject/features/games_and_story/games/gameMovment/game_movement_jump.dart';
import 'package:telaproject/features/games_and_story/games/gameMovment/geme_movement_rotate.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/database/sql.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/backgrond.dart';
import '../../core/widgets/custom_btn.dart';
import 'Widgets/widget.dart';
import 'games/gameMovment/game_movement_walk.dart';
import 'games/word_connection.dart';
import 'games/word_connection1.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

Sql sql = Sql();

class _GameState extends State<Game> {
  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  int score4 = 0;
  int score5 = 0;
  int score6 = 0;
  int score7 = 0;
  var userId = getIt<CacheHelper>().getData(key: "login");
//  var resultUpdate = getIt<CacheHelper>().getData(key: "scoreUpdate");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      readUserScore();
    });
  }
  void navigate(router, int score) {
    int resultScore = 0;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => router))
        .then((value) {
      if (value != null) {
        score = value as int;
        setState(() {
          readUserScore();
          resultScore += score;
          sql.updateData(
              "update UserInformation set score='${sql.score+resultScore}' where user_id ='$userId'");
          print( resultScore);
        });
      }
    });
  }

  Sql sql = Sql();

  insertData(String nameOfGame, String pathImage, router, int score) async {
    final result = await sql.insertData(
        'INSERT INTO History(name_of_content,user_id,image) VALUES("$nameOfGame", "$userId","$pathImage")');
    if (result != null) {
      print("s= $score");
      navigate(router, score);
      print("Inserted data");
    } else {
      print("no inserted ");
    }
  }

  readUserScore() async {
    var response = await sql.readUserScore(userId);
    if (response == true) {
      setState(() {
        print(sql.score);
      });
    } else {
      return 0;
    }
  }



  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 60, right: 26, left: 210, bottom: 100),
              width: 265,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColor.primaryColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: Text(
                  "score ${sql.score} 🏆",
                  style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(
                      color: AppColor.white, fontSize: 15),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 23,
                left: 29,
              ),
              padding: const EdgeInsets.only(
                  top: 30, bottom: 41, right: 20, left: 10),
              width: 529,
              height: 450,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: AppColor.white2),
              child: ListView(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                physics: const BouncingScrollPhysics(),
                children: [
                  GestureDetector(
                      onTap: () => insertData(
                          "connecting the words",
                          "assets/images/image4.png",
                          const WordConnection(),
                          score1),
                      child: game1("image4.png", "connecting", "the words")),
                  GestureDetector(
                      onTap: () => insertData(
                          "Matching Img with Word",
                          "assets/images/Tela/IMG_6484.JPG",
                          const WordConnection1(),
                          score1),
                      child: game1("Tela/IMG_6484.JPG", "Matching", "Img with Word")),
                  GestureDetector(
                      onTap: () => insertData("ExpertionArthimtic",
                          "assets/images/15.jpeg", const MathPage(), score2),
                      child: game1("15.jpeg", "Expertion ", "Arthimtic")),
                  GestureDetector(
                      onTap: () => insertData(
                          "fill in Arabic",
                          "assets/images/image5.png",
                          const FillArabic(),
                          score3),
                      child: fillinTheblanke(context, "Arabic", "/FillArabic")),
                  GestureDetector(
                      onTap: () => insertData(
                          "fill in English",
                          "assets/images/image5.png",
                          const FillEnglish(),
                          score4),
                      child:
                          fillinTheblanke(context, "English", "/FillEnglish")),
                  GestureDetector(
                      onTap: () => insertData(
                          "Back Turns",
                          "assets/images/4.jpg",
                          const GameMovementWalk(),
                          score5),
                      child: game1("4.jpg", "Exercise1", "Back Turns")),
                  GestureDetector(
                      onTap: () => insertData(
                          "Side Bends",
                          "assets/images/0.jpg",
                          const GameMovementJump(),
                          score6),
                      child: game1("0.jpg", "Exercise2", "Side Bends")),
                  GestureDetector(
                      onTap: () => insertData(
                          "Wind Mills",
                          "assets/images/7.jpg",
                          const GameMovementRotate(),
                          score7),
                      child: game1("7.jpg", "Exercise3", "Wind Mills")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: CustomBtn(
                text: "",
                width: 250,
                height: 60,
                onPressed: () {
             setState(() {
               var cloth = getIt<CacheHelper>().getData(key: "clothe");
               var ut=getIt<CacheHelper>().getData(key: "loginTypeUser");
               if (cloth != null) {
                 GoRouter.of(context).push(
                   '/HomePage',
                   extra: cloth,
                 );
               } else {

               print('there is an error in saving clothe');

               }

             });
                },
              ).customButton(const Icon(
                Icons.home_outlined,
                size: 50,
                color: AppColor.black,
              )),
            )
          ],
        ),
      ),
    );
  }
}
