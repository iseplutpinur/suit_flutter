// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:suit/screens/results_screen.dart';
import 'package:suit/utilis/game.dart';
import 'package:suit/widgets/button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
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

            /* Setting Game play pad */
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: MediaQuery.of(context).size.width / 2 -
                          (btnWidth / 2) -
                          20,
                      child: Hero(
                        tag: "Batu",
                        child: gameBtn(
                          () {
                            // print("anda memilih batu");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    GameScreen(GameChoice("Batu")),
                              ),
                            );
                          },
                          "assets/batu_btn.png",
                          btnWidth,
                        ),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      left:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Gunting",
                        child: gameBtn(() {
                          // print("anda memilih gunting");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Gunting")),
                            ),
                          );
                        }, "assets/gunting_btn.png", btnWidth),
                      ),
                    ),
                    Positioned(
                      top: btnWidth,
                      right:
                          MediaQuery.of(context).size.width / 2 - btnWidth - 40,
                      child: Hero(
                        tag: "Kertas",
                        child: gameBtn(() {
                          // print("anda memilih kertas");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  GameScreen(GameChoice("Kertas")),
                            ),
                          );
                        }, "assets/kertas_btn.png", btnWidth),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                padding: const EdgeInsets.all(24.0),
                onPressed: () {
                  setState(() {
                    Game.gameScore = 0;
                  });
                },
                shape: const StadiumBorder(
                  side: BorderSide(color: Colors.white, width: 5),
                ),
                child: const Text(
                  "Reset Skor",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
