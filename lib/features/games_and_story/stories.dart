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

                      // story 1
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

                      // story 2
                      storyContainer(context, " Ouma’s amazing flowers", [
                        "Ouma has a window box full of amazing flowers.\n Robyn wants to pick them all!",
                        "Please don't pick the flowers, Robyn!\n Ouma loves to see them when she opens her curtains.",
                        "Butterflies dance around the petals.\n It's so lovely to have these visitors.",
                        "The bees use the flowers to make delicious honey.",
                        "The flowers bring joy to everyone who walks past Ouma's house.",
                        "The neighbour likes to smell them when he visits for tea.",
                        "Sometimes,\n sunbirds drink the\n sweet nectar from the flowers.",
                        "Look, a tiny beetle!\nIt shines in the sun.\nAnd there's a fat caterpillar!",
                        "Please don't pick Ouma's flowers, Robyn!\nThey won't stay fresh very long.",
                        "\"I won't pick them, Ouma,\" says Robyn, even though she really wants to.\nShe feels a little bit sad!",
                        "Ouma doesn't want Robyn to be sad.\n\"Okay, Robyn,\" says Ouma. \"You can pick your favourite flower.\"",
                        "\"And I have an idea...\nLet's plant more flowers together!\"",
                      ], [
                        "a21.JPG",
                        "IMG_6012.jpg",
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

                      // story 3
                      storyContainer(context, " Bean Hole!", [
                        "When Tom was four years old, he had all of his teeth.\nBut when he turned five, one of them fell out.",
                        "Just one tooth.\nIt was one on the bottom.",
                        "Tom could feel the gum where the tooth used to be.\nIt felt all soft and squishy.",
                        "Tom liked to poke his tongue through the hole.\nBut he missed having a tooth there.",
                        " One day, he was eating his dinner, when he noticed he could do something special.",
                        " You could poke a BEAN through the hole!",
                        " \"Look at that,\" said\nMummy. \"You have a bean hole!\"",
                        " Big brother Ben had already lost some of his teeth, but Ben didn't have a bean hole.\nHis teeth had already grown back again.",
                        "\"Mum!\" said Ben. \"I want a bean hole!\"",
                        " Mummy looked caretully at Ben's mouth.",
                        " \"You don't have a bean hole,\" she said. \"But you might have space for a very small noodle. In\nfact, we could say that you have a noodle slit.\"",
                        "\"A noodle slit!\"\nsaid Ben.\nHe was pleased with that, too.",
                        "\"But a very thin one,\" said\nMummy.",
                        "Tom discovered that his hole was not just a bean hole.\nIt was also a spaghetti hole.",
                        " And a carrot-stick hole.",
                        " And an asparagus hole.",
                        "And a cheese hole.",
                        " And a sticking-out-the-tongue hole!",
                        " Tom was almost sad when his new tooth came through and he lost his bean hole.",
                        " But luckily there were 19 more bean holes to come!",
                      ], [
                        "IMG_6071.JPG",
                        "IMG_6072.JPG",
                        "IMG_6073.JPG",
                        "IMG_6074.JPG",
                        "IMG_6075.JPG",
                        "IMG_6076.JPG",
                        "IMG_6077.JPG",
                        "IMG_6078.JPG",
                        "IMG_6079.JPG",
                        "IMG_6080.JPG",
                        "IMG_6081.JPG",
                        "IMG_6082.JPG",
                        "IMG_6083.JPG",
                        "IMG_6084.JPG",
                        "IMG_6085.JPG",
                        "IMG_6086.JPG",
                        "IMG_6087.JPG",
                        "IMG_6088.JPG",
                        "IMG_6089.JPG",
                        "IMG_6090.JPG",
                        "IMG_6091.JPG",
                        "IMG_6092.JPG",

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
            GoRouter.of(context).push("/Story1",
                extra: StoryModel(nameOfStory, storyText, imageStory));
          } else if (nameOfStory == " Ouma’s amazing flowers") {
            GoRouter.of(context).push("/Story2",
                extra: StoryModel(nameOfStory, storyText, imageStory));
          }
          else if (nameOfStory == " Bean Hole!") {
            GoRouter.of(context).push("/Story3",
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
