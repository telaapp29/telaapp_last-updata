import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/Functions/functions.dart';
import 'package:telaproject/core/utils/app_colors.dart';
import 'package:telaproject/core/utils/app_text_style.dart';

import '../../core/database/cash/cache_helper.dart';
import '../../core/services/service_locator.dart';

class Personality extends StatelessWidget {
  const Personality({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColor.orange.withOpacity(0.9),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 100,top: 100),
              child: Text(
                "personality",
                style: CustomTextStyles.Merriweather100style90,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 150),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  personal(
                      width, height, "assets/images/boy.png", "Boy", context,"assets/images/boy/boy7.png"),
                  personal(
                      width, height, "assets/images/girl.png", "Girl", context,"assets/images/girl/girl11.png"),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }

  Widget personal(width, height, pathImage, text, BuildContext context,pathImageClothes) =>
      GestureDetector(
        onTap: () {
          getIt<CacheHelper>().removeData(key: 'login');
          getIt<CacheHelper>().removeData(key: 'fromHomePage');
            getIt<CacheHelper>().removeData(key: "scoreUpdate");
            customNavigate(context, '/Signup');
          getIt<CacheHelper>().saveData(key: "userType", value: text);
        },
        child: Container(
          width: width / 2.4,
          height: height /2.4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.orange.withOpacity(0.9)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
             Stack(
               children: [
                 ClipRRect(
                     borderRadius: BorderRadius.circular(70),
                     child: Image.asset(
                       pathImage,
                       width: width / 3,
                       height: height / 3,
                     )),
                 Positioned(
                   top: 61,
                   right: 3,
                   child: ClipRRect(
                       borderRadius: BorderRadius.circular(70),
                       child: Image.asset(
                         pathImageClothes,
                         width: width / 3,
                         height: height / 3,
                       )),
                 ),
               ],
             ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                child: Text(
                  text,
                  style: CustomTextStyles.Merriweatherstyle40.copyWith(
                      fontWeight: FontWeight.bold, color: AppColor.white),
                ),
              ),
            ],
          ),
        ),
      );
}
