import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/database/sql.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import 'package:telaproject/core/utils/app_text_style.dart';

import '../../core/Functions/functions.dart';
import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';

class Clothes extends StatefulWidget {
  const Clothes({super.key, required this.typePerson});

  final String typePerson;

  @override
  State<Clothes> createState() => _ClothesState();
}

class _ClothesState extends State<Clothes> {
  List girlClothes = [
    "girl1.png",
    "girl2.png",
    "girl3.png",
    "girl4.png",
    "girl5.png",
    "girl6.png",
    "girl7.png",
    "girl8.png",
    "girl9.png",
    "girl10.png",
    "girl11.png",
  ];

  Sql sql = Sql();

  List boyClothes = [
    "boy1.png",
    "boy2.png",
    "boy3.png",
    "boy4.png",
    "boy5.png",
    "boy6.png",
    "boy7.png",
    "boy8.png",
    "boy9.png",
    "boy10.png",
    "boy11.png",
  ];

  var userId = getIt<CacheHelper>().getData(key: "login");
  var usertype = getIt<CacheHelper>().getData(key: "fromHomePage");
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      readUserScore();
    });
  }

  readUserScore() async {
    var response = await sql.readUserScore(userId);
    if (response == true) {
      print(sql.score);
    } else {
      return 0;
    }
  }

  bool isNoScore = false;

  @override
  Widget build(BuildContext context) {

    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.primaryColor.withOpacity(0.8),
      body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              color: AppColor.primaryColor.withOpacity(0.5),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        itemCount: girlClothes.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (usertype == 2) {
                                if ( sql.score >= 20) {
                                  sql.score -= 20;
                                  setState(() {
                                    sql.updateData(
                                        "update UserInformation set score='${sql.score}' where user_id ='$userId'");
                                    var result2 = sql.insertData(
                                        'INSERT INTO Clothes(image_clothes,user_id) VALUES("${(widget.typePerson == "Boy") ? boyClothes[index] : girlClothes[index]}", "$userId")');
                                    readUserScore();
                                    print((widget.typePerson == "Boy")
                                        ? boyClothes[index]
                                        : girlClothes[index]);
                                    GoRouter.of(context).push('/HomePage',
                                        extra: (widget.typePerson == "Boy")
                                            ? boyClothes[index]
                                            : girlClothes[index]);
                                  });
                                } else {
                                  setState(() {
                                    isNoScore = true;
                                  });
                                }
                              } getIt<CacheHelper>().saveData(key: "clothe", value:(widget.typePerson == "Boy") ? boyClothes[index] : girlClothes[index] );


                              var result3 = sql.insertData(
                                  'INSERT INTO Clothes(image_clothes,user_id) VALUES("${(widget.typePerson == "Boy") ? boyClothes[index] : girlClothes[index]}", "$userId")');
                              GoRouter.of(context).push('/HomePage',
                                  extra: (widget.typePerson == "Boy")
                                      ? boyClothes[index]
                                      : girlClothes[index]);
                              if (result3 != null) {
                                print("Inserted data");
                              } else {
                                print("no inserted ");
                              }
                            },
                            child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10, top: 15),
                                padding: const EdgeInsets.only(
                                    top: 20, bottom: 20, right: 7),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppColor.primaryColor.withOpacity(0.9),
                                ),
                                child: (widget.typePerson == "Boy")
                                    ? Image.asset(
                                        "assets/images/boy/${boyClothes[index]}",
                                        width: 50,
                                        height: 50,
                                      )
                                    : Image.asset(
                                        "assets/images/girl/${girlClothes[index]}",
                                        width: 50,
                                        height: 50,
                                      )),
                          );
                        }),
                  ),
                ],
              ))),
    );
  }
}
