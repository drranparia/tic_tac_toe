import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Screens/landing_page.dart';
import 'Constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // fontFamily: GoogleFonts.exo2().fontFamily,
        primaryColor: AColor.homeColor,
      ),
      home: const Landing(),
      debugShowCheckedModeBanner: false,
    );
  }
}
