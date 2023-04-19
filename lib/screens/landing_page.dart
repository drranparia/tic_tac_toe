import 'package:flutter/material.dart';
import 'package:tic_tac_toe/classes/textStyles.dart';
import 'package:tic_tac_toe/screens/home.dart';

import '../classes/colors.dart';

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
                  child: SizedBox(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AColor.white),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return const Home();
                        }), (route) => false);
                      },
                      child: Center(
                        child: Text(
                          'Play Game',
                          style: buttonText,
                        ),
                      ),
                    ),
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
