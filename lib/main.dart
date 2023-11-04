// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apimodel/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
        home:AnimatedSplashScreen(
            duration: 2700,
            splash: Lottie.asset('assets/images/Animation.json'),
            splashIconSize: 300,
            nextScreen: const HomeScreen(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.fade,
            backgroundColor: Colors.white));
  }
}

