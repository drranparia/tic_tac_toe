import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/Constants/sizeConst.dart';
import 'package:tic_tac_toe/Constants/textStyles.dart';
import 'package:tic_tac_toe/Screens/four_x_four.dart';
import 'package:tic_tac_toe/Screens/three_x_three.dart';

import '../Constants/colors.dart';

class Landing extends StatefulWidget {
  const Landing({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColor.landingColor,
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    'TIC TAC TOE',
                    style: landingTitle,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/gif2.gif"))),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      spacerH10,
                      SizedBox(
                        height: 60,
                        width: 250,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AColor.white),
                          ),
                          onPressed: () => Get.to(const ThreeXThree()),
                          child: Center(
                            child: Text(
                              'Play 3 x 3',
                              style: buttonText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 250,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AColor.white),
                          ),
                          onPressed: () => Get.to(const FourXFour()),
                          child: Center(
                            child: Text(
                              'Play 4 x 4',
                              style: buttonText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
