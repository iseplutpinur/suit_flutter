import 'dart:math';

import 'package:flutter/material.dart';
import 'package:suit/screens/main_screen.dart';
import 'package:suit/utilis/game.dart';
import 'package:suit/widgets/button.dart';

// ignore: must_be_immutable
class GameScreen extends StatefulWidget {
  GameScreen(this.gameChoice, {Key? key}) : super(key: key);
  GameChoice gameChoice;
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  /* Generating random choice */
  String? randomChoice() {
    Random random = Random();
    int robotChoiceIndex = random.nextInt(3);
    return Game.choices[robotChoiceIndex];
  }

  @override
  Widget build(BuildContext context) {
    String robotChoice = randomChoice()!;

    String? robotChoicePath;
    switch (robotChoice) {
      case "Batu":
        robotChoicePath = "assets/batu_btn.png";
        break;
      case "Kertas":
        robotChoicePath = "assets/kertas_btn.png";
        break;
      case "Gunting":
        robotChoicePath = "assets/gunting_btn.png";
        break;
      default:
    }
    String? playerChoice;
    switch (widget.gameChoice.type) {
      case "Batu":
        playerChoice = "assets/batu_btn.png";
        break;
      case "Kertas":
        playerChoice = "assets/kertas_btn.png";
        break;
      case "Gunting":
        playerChoice = "assets/gunting_btn.png";
        break;
      default:
    }
    if (GameChoice.gameRules[widget.gameChoice.type]![robotChoice] ==
        "Anda Menang") {
      setState(() {
        Game.gameScore++;
      });
    }
    double btnWidth = MediaQuery.of(context).size.width / 2 - 40;

    return Scaffold(
      backgroundColor: const Color(0xFF060A47),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 34, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SKOR",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${Game.gameScore}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            /* Setting  Game play pad */
            Expanded(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Hero(
                      tag: "${widget.gameChoice.type}",
                      child: gameBtn(() {}, playerChoice!, btnWidth - 20),
                    ),
                    const Text(
                      "VS",
                      style: TextStyle(color: Colors.white, fontSize: 26.0),
                    ),
                    AnimatedOpacity(
                      opacity: 1,
                      duration: const Duration(seconds: 3),
                      child: gameBtn(() {}, robotChoicePath!, btnWidth - 20),
                    )
                  ],
                ),
              ),
            ),
            Text(
              "${GameChoice.gameRules[widget.gameChoice.type]![robotChoice]}",
              style: const TextStyle(color: Colors.white, fontSize: 36.0),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(24.0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ));
                },
                shape: const StadiumBorder(),
                fillColor: Colors.white,
                child: const Text(
                  "Main Lagi",
                  style: TextStyle(
                      color: Color(0xFF060A47),
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
