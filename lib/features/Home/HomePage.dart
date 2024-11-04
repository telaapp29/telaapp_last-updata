import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/database/sql.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';
import '../../core/widgets/backgrond.dart';
import '../games_and_story/games/gameMovment/game_movement_jump.dart';
import '../games_and_story/games/gameMovment/game_movement_walk.dart';
import '../games_and_story/games/gameMovment/geme_movement_rotate.dart';
import 'Widegets/games.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.image,
  });

  final String image;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isNoScore = false;
  int _seconds = 0;
  int random = Random().nextInt(3);
  late Timer _timer;
  late Timer _timerR;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      readUserScore();
      getIt<CacheHelper>().saveData(
          key: "cloth",
          value: (userType == "Boy")
              ? "assets/images/boy/${widget.image}"
              : "assets/images/girl/${widget.image}");
      Future.delayed(const Duration(minutes: 10), () {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => const GameMovementWalk()))
            .then((value) {
          if (value != null) {
            setState(() {
              readUserScore();
            });
          }
        });
      });

      Future.delayed(const Duration(minutes: 20), () {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => const GameMovementJump()))
            .then((value) {
          if (value != null) {
            setState(() {
              readUserScore();
            });
          }
        });
      });

      Future.delayed(const Duration(minutes: 30), () {
        Navigator.of(context)
            .push(MaterialPageRoute(
                builder: (context) => const GameMovementRotate()))
            .then((value) {
          if (value != null) {
            setState(() {
              readUserScore();
            });
          }
        });
      });
    });
    _timer = Timer.periodic(
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
    setState(() {
      readUserScore();
    });
    super.dispose();
    _timer.cancel();
  }

  Sql sql = Sql();
  var userId = getIt<CacheHelper>().getData(key: "login");

  readUserScore() async {
    var response = await sql.readUserScore(userId);
    if (response == true) {
      print(sql.score);
    }
  }
  var userType = getIt<CacheHelper>().getData(key: "loginTypeUser");
  @override
  Widget build(BuildContext context) {
    var resultUpdate = getIt<CacheHelper>().getData(key: "scoreUpdates");

    return Background(
        child: ListView(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // print(sql.score);
                    if (sql.score >= 20) {
                      getIt<CacheHelper>()
                          .saveData(key: "fromHomePage", value: 2);
                      GoRouter.of(context).push('/Clothes', extra: userType);
                    } else {
                      setState(() {
                        isNoScore = true;
                        print(isNoScore);
                      });
                    }
                  });
                },
                child: Stack(
                  children: [
                    Image.asset(
                      (userType == "Boy")
                          ? "assets/images/boy.png"
                          : "assets/images/girl.png",
                      width: 80,
                      height: 80,
                    ),
                    Positioned(
                      top: (userType == "Boy") ? 39 : 37,
                      right: (userType == "Boy") ? 3 : 7,
                      left: 3,
                      bottom: (userType == "Boy") ? 2 : 0,
                      child: Image.asset(
                        (userType == "Boy")
                            ? "assets/images/boy/${widget.image}"
                            : "assets/images/girl/${widget.image}",
                        width: 80,
                        height: 80,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: IconButton(
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                  ),
                  onPressed: () {
                    GoRouter.of(context).push("/History", extra: _seconds);
                  },
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColor.white3,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin:
              const EdgeInsets.only(top: 10, right: 26, left: 210, bottom: 10),
          width: 265,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: AppColor.primaryColor),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 6,
            ),
            child: Text(
              "score ${sql.score} 🏆",
              style: CustomTextStyles.MerriweatherBlackstyle24.copyWith(
                  color: AppColor.white, fontSize: 15),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to",
                style: CustomTextStyles.Interstyle30,
              ),
              Text(
                "Tela",
                style: CustomTextStyles.Interstyle30.copyWith(fontSize: 25),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 50,
          ),
          child: Column(
            children: [
              Games(
                text: "Let's Explore",
                containerColor1: AppColor.cyan2,
                containerColor2: AppColor.white,
                image: "assets/images/image1.png",
                path: "/CameraPicture",
                com: true,
              ),
              Games(
                text: "Let's Learn",
                containerColor1: AppColor.lightGreen,
                containerColor2: AppColor.white,
                image: "assets/images/image2.png",
                path: "/Stories",

                  ),
              Games(
                text: "Let's Play",
                containerColor1: AppColor.yellow,
                containerColor2: AppColor.white,
                image: "assets/images/image3.png",
                path: "/Game",
              ),
              if (isNoScore)
                const Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "",
                  ),
                ),
            ],
          ),
        ),
      ],
    ));
  }
}
