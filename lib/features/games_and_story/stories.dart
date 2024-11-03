import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telaproject/core/utils/app_text_style.dart';
import 'package:telaproject/features/games_and_story/model/storymodel.dart';
import '../../core/Functions/functions.dart';
import '../../core/utils/app_colors.dart';
import '../../core/widgets/custom_btn.dart';

class Stories extends StatelessWidget {
  const Stories({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 12, bottom: 30),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 40,
                  ),
                  onPressed: () {
                    customRemoveNavigate(context);
                  },
                ),
              ),
              Container(
                width: 568,
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.white1,
                ),
                child: Text(
                  " choose your today’s topic",
                  style: CustomTextStyles.Interstyle25.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),

              Container(
                margin: const EdgeInsets.only(
                  right: 23,
                  left: 29,
                  top: 40
                ),
                width: 529,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: AppColor.white2,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      storyContainer(context, "Amahle wants to help!", [
                        "Every time Amahle wants to help, all she hears is \"NO\"\nMama picks up Amahle's toothbrush.\n\"Mama, can I squeeze the toothpaste?\"\n But Mama says...",
                        "No, Amahle, you are too young. ",
                        "Baba is looking for his keys.\n\"Baba, can I drive your bakkie?\"\n  But Baba says... ",
                        "No, Amahle, you are too young. ",
                        "Mkhulu's chickens are clucking outside.\"Mkhulu, can I feed the chickens?\"\nBut Mkhulu says...",
                        "No, Amahle, you are too young. ",
                        "Amahle sees Mama in the kitchen.\"Mama, can I boil water for tea?\"\nBut Mama says...",
                        "No, Amahle, you are too young. ",
                        "Amahle runs over to\nGogo's vegetable garden.\n\"Gogo, can I water the plants?\"\nBut Gogo says...",
                        "No, Amahle, you are too young. ",
                        "Amahle grabs a book from the table.\"Mama, can I read to Teddy?\"\nBut Mama says...",
                        "Yes you can, Amahle.",
                      ], [
                        "w11.JPG",
                        "s12.jpg",
                        "s13.JPG",
                        "s14.JPG",
                        "s15.JPG",
                        "s16.JPG",
                        "s17.JPG",
                        "s18.JPG",
                        "s19.JPG",
                        "s20.JPG",
                        "s21.JPG",
                        "s22.JPG",
                        "s23.JPG",
                        "s24.JPG",
                        "s25.JPG",
                      ]),
                      storyContainer(context, "A", [
                        "Every time Amahle wants to help, all she hears is \"NO\"\nMama picks up Amahle's toothbrush.\n\"Mama, can I squeeze the toothpaste?\"\n But Mama says...",
                        "No, Amahle, you are too young. ",
                        "Baba is looking for his keys.\n\"Baba, can I drive your bakkie?\"\n  But Baba says... ",
                        "No, Amahle, you are too young. ",
                        "Mkhulu's chickens are clucking outside.\"Mkhulu, can I feed the chickens?\"\nBut Mkhulu says...",
                        "No, Amahle, you are too young. ",
                        "Amahle sees Mama in the kitchen.\"Mama, can I boil water for tea?\"\nBut Mama says...",
                        "No, Amahle, you are too young. ",
                        "Amahle runs over to\nGogo's vegetable garden.\n\"Gogo, can I water the plants?\"\nBut Gogo says...",
                        "No, Amahle, you are too young. ",
                        "Amahle grabs a book from the table.\"Mama, can I read to Teddy?\"\nBut Mama says...",
                        "Yes you can, Amahle.",
                      ], [
                        "IMG_6011.JPG",
                        "IMG_6012.JPG",
                        "IMG_6013.JPG",
                        "IMG_6014.JPG",
                        "IMG_6015.JPG",
                        "IMG_6016.JPG",
                        "IMG_6017.JPG",
                        "IMG_6018.JPG",
                        "IMG_6019.JPG",
                        "IMG_6020.JPG",
                        "IMG_6021.JPG",
                        "IMG_6022.JPG",
                        "IMG_6023.JPG",

                      ]),

                      //storyContainer(context,"The ForgetFul Elephant","Peter the Elephant just can't remember a thing! What will he do when he forgets why he's made himself a reminder?!","s10.jpg","s11.jpg","s12.jpg"),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 22, left: 80),
                child: CustomBtn(
                  text: "ee",
                  width: 250,
                  height: 60,
                  onPressed: () {
                    customRemoveNavigate(context);
                  },
                ).customButton(const Icon(
                  Icons.home_outlined,
                  size: 50,
                  color: AppColor.black,
                )),
              ),
            ],
          ),
        ),
      )),
    );
  }

  Widget storyContainer(BuildContext context, String nameOfStory,
          List storyText, List imageStory) =>
      GestureDetector(
        onTap: () {
          if (nameOfStory == "Amahle wants to help!") {
            GoRouter.of(context).push("/Story",
                extra: StoryModel(nameOfStory, storyText, imageStory));
          } else if (nameOfStory == "A") {
            GoRouter.of(context).push("/Story",
                extra: StoryModel(nameOfStory, storyText, imageStory));
          }
        }
        ,
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 160,
                height: 130,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: AppColor.white,
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/image6.png",
                      )),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                      width: 120,
                      child: Text(
                        nameOfStory,
                        style: CustomTextStyles.Merriweatherstyle40,
                        overflow: TextOverflow.ellipsis,
                      )),
                  Container(
                    width: 100,
                    height: 5,
                    decoration: BoxDecoration(
                      color: AppColor.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
