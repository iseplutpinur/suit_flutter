import 'dart:async';

import 'package:flutter/material.dart';
import 'package:suit/screens/main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenWidget(),
    );
  }
}

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double? height = MediaQuery.of(context).size.height;
    const double imageWidth = 150;

    Timer(
      const Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen(),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: const Color(0xFF060A47),
      body: Center(
        child: Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: (height / 2) - imageWidth, bottom: 20),
                  child: Image.asset(
                    "assets/batu_btn.png",
                    width: imageWidth,
                  ),
                ),
                const Text(
                  "Suit Game",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Sans",
                    fontSize: 35,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            )),
      ),
      bottomNavigationBar: const BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(bottom: 16),
          child: Text(
            "Projek Akhir UTS Mobile Programming Lanjut\nIsep Lutpi Nur (2113191079)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFFFFFFF),
              height: 2,
            ),
          ),
        ),
        elevation: 0,
      ),
    );
  }
}
