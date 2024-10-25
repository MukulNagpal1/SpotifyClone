import 'dart:async';

import 'package:flutter/material.dart';
import 'package:index/home.dart';
import "package:lottie/lottie.dart";

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    });
  }

  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     color: Colors.black,
    //     child: Center(
    //       child: Image.asset(
    //         "assets/images/spotifyLogo.png",
    //         height: 250,
    //         width: 250,
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/animate/animation3.json',
          width: 200, // Adjust width as needed
          height: 200, // Adjust height as needed
          fit: BoxFit.contain, // Adjust fit as needed
        ),
      ),
    );
  }
}
