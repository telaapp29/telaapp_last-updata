import 'package:flutter/material.dart';
import 'package:telaproject/core/widgets/custom_btn.dart';

import '../../../core/utils/app_colors.dart';
import '../model/wordModel.dart';

class WordConnection1 extends StatefulWidget {
  const WordConnection1({super.key});

  @override
  State<WordConnection1> createState() => _WordConnection1State();
}

class _WordConnection1State extends State<WordConnection1> {
  List<WordModel2> wordsArabic = [];
  List<WordModel2> image = [];
  int score = 0;
  bool gameOver = true;

  void initGame() {
    gameOver = false;
    score = 0;

    wordsArabic = [
      WordModel2(name: 'تيلة', value: 'IMG_6485.JPG', image: 'assets/images/Tela/IMG_6485.JPG'),
      WordModel2(name: 'دلة', value: 'IMG_6484.JPG', image: 'assets/images/Tela/IMG_6484.JPG'),
      WordModel2(name: 'السحارة', value: 'IMG_6490.JPG', image: 'assets/images/Tela/IMG_6490.PNG'),
      WordModel2(name: 'السراي', value: 'IMG_6489.JPG', image: 'assets/images/Tela/IMG_6489.PNG'),
      WordModel2(name: 'المهفة', value: 'IMG_6494.JPG', image: 'assets/images/Tela/IMG_6494.PNG'),
    ];


    image = List<WordModel2>.from(wordsArabic);
    wordsArabic.shuffle();
    image.shuffle();
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    if (wordsArabic.isEmpty) gameOver = true;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Score: ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      TextSpan(
                        text: '$score',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                ),
              ),
              if (!gameOver)
                Row(
                  children: [
                    const Spacer(),
                    // Draggable Arabic Words
                    Column(
                      children: wordsArabic.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          child: Draggable<WordModel2>(
                            data: item,
                            childWhenDragging: buildTextTile(item.name, Colors.grey[400]!),
                            feedback: buildTextTile(item.name, Colors.grey[400]!),
                            child: buildTextTile(item.name, Colors.grey[300]!),
                          ),
                        );
                      }).toList(),
                    ),
                    const Spacer(flex: 2),
                    // DragTarget for Images
                    Column(
                      children: image.map((item) {
                        return DragTarget<WordModel2>(
                          onAccept: (receivedItem) {
                            setState(() {
                              if (item.value == receivedItem.value) {
                                wordsArabic.remove(receivedItem);
                                image.remove(item);
                                score += 5;
                              } else {
                                if (score > 0) score -= 5;
                              }
                            });
                          },
                          onWillAccept: (_) {
                            setState(() {
                              item.accepting = true;
                            });
                            return true;
                          },
                          onLeave: (_) {
                            setState(() {
                              item.accepting = false;
                            });
                          },
                          builder: (context, acceptedItems, rejectedItems) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: item.accepting ? Colors.grey[400] : Colors.grey[200],
                            ),
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.width / 6.5,
                            width: MediaQuery.of(context).size.width / 3,
                            margin: const EdgeInsets.all(8),
                            child: Image.asset(item.image, fit: BoxFit.cover),
                          ),
                        );
                      }).toList(),
                    ),
                    const Spacer(),
                  ],
                ),
              if (gameOver)
                Center(
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Game Over"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(result()),
                      ),
                    ],
                  ),
                ),
              if (gameOver)
                Column(
                  children: [
                    buildButton("New Game", () {
                      setState(() {
                        initGame();
                      });
                    }),
                    buildButton("Exit", () {
                      Navigator.of(context).pop(score);
                    }),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextTile(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.width / 6.5,
      width: MediaQuery.of(context).size.width / 3,
      child: Text(text),
    );
  }

  Widget buildButton(String text, VoidCallback onPressed) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      height: MediaQuery.of(context).size.width / 10,
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }

  String result() {
    if (score == 100) return 'Awesome';
    return 'Play again to get a better score!';
  }
}
