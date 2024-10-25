import "package:flutter/material.dart";
import "package:index/SplashScreen.dart";
import "package:index/home.dart";

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IntroPage(),
      ),
    );
  }
}
