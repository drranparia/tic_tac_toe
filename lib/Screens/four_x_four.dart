import 'package:flutter/material.dart';

import '../Constants/colors.dart';
import '../Constants/sizeConst.dart';
import '../Constants/textStyles.dart';

class FourXFour extends StatefulWidget {
  const FourXFour({super.key});

  @override
  State<FourXFour> createState() => _FourXFourState();
}

class _FourXFourState extends State<FourXFour> {
  bool oTurn = true;
  List<String> dispXO = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];
  int oScore = 0;
  int xScore = 0;
  int filledBox = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColor.homeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.1,
        centerTitle: true,
        title: Text(
          '4x4 Tic Tac Toe',
          style: appBarTitle,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player\'O\'',
                        style: playerStats,
                      ),
                      spacerH10,
                      Text(
                        oScore.toString(),
                        style: playerStats,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Player\'X\'',
                        style: playerStats,
                      ),
                      spacerH10,
                      Text(
                        xScore.toString(),
                        style: playerStats,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                    itemCount: 16,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          tapped(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AColor.grey,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              dispXO[index],
                              // index.toString(),
                              style: textStyle30White,
                            ),
                          ),
                        ),
                      );
                    })),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(AColor.white),
                      ),
                      onPressed: () {
                        restart();
                      },
                      child: Center(
                        child: Text(
                          'Restart',
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

  void tapped(int index) {
    setState(() {
      if (oTurn && dispXO[index] == '') {
        dispXO[index] = 'O';
        filledBox += 1;
      } else if (!oTurn && dispXO[index] == '') {
        dispXO[index] = 'X';
        filledBox += 1;
      }
      // else if (oTurn && dispXO[index] != '') {
      //   dispXO[index] = '';
      //   filledBox = filledBox - 1;
      // } else if (!oTurn && dispXO[index] != '') {
      //   dispXO[index] = '';
      //   filledBox = filledBox - 1;
      // }
      oTurn = !oTurn;
      checkWinner();
    });
  }

  void checkWinner() {
    //1st ROW
    if (dispXO[0] == dispXO[1] &&
        dispXO[0] == dispXO[2] &&
        dispXO[0] == dispXO[3] &&
        dispXO[0] != '') {
      showDialogBox(dispXO[0]);
    }
    //2nd ROW
    else if (dispXO[4] == dispXO[5] &&
        dispXO[4] == dispXO[6] &&
        dispXO[4] == dispXO[7] &&
        dispXO[4] != '') {
      showDialogBox(dispXO[4]);
    }
    //3rd ROW
    else if (dispXO[8] == dispXO[9] &&
        dispXO[8] == dispXO[10] &&
        dispXO[8] == dispXO[11] &&
        dispXO[8] != '') {
      showDialogBox(dispXO[8]);
    }
    //4th ROW
    else if (dispXO[12] == dispXO[13] &&
        dispXO[12] == dispXO[14] &&
        dispXO[12] == dispXO[15] &&
        dispXO[12] != '') {
      showDialogBox(dispXO[12]);
    }
    //1st COLUMN
    else if (dispXO[0] == dispXO[4] &&
        dispXO[0] == dispXO[8] &&
        dispXO[0] == dispXO[12] &&
        dispXO[0] != '') {
      showDialogBox(dispXO[0]);
    }
    //2nd COLUMN
    else if (dispXO[1] == dispXO[5] &&
        dispXO[1] == dispXO[9] &&
        dispXO[1] == dispXO[13] &&
        dispXO[1] != '') {
      showDialogBox(dispXO[1]);
    }
    //3rd COLUMN
    else if (dispXO[2] == dispXO[6] &&
        dispXO[2] == dispXO[10] &&
        dispXO[2] == dispXO[14] &&
        dispXO[2] != '') {
      showDialogBox(dispXO[2]);
    }
    //3rd COLUMN
    else if (dispXO[3] == dispXO[7] &&
        dispXO[3] == dispXO[11] &&
        dispXO[3] == dispXO[15] &&
        dispXO[3] != '') {
      showDialogBox(dispXO[3]);
    }
    //1st DIAGONAL
    else if (dispXO[0] == dispXO[5] &&
        dispXO[0] == dispXO[10] &&
        dispXO[0] == dispXO[15] &&
        dispXO[0] != '') {
      showDialogBox(dispXO[0]);
    }
    //2nd DIAGONAL
    else if (dispXO[3] == dispXO[6] &&
        dispXO[3] == dispXO[9] &&
        dispXO[3] == dispXO[12] &&
        dispXO[3] != '') {
      showDialogBox(dispXO[3]);
    }

    //DRAW
    else if (filledBox == 16) {
      showDrawDialogBox();
    }
  }

  void showDrawDialogBox() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Match Is Draw'),
            actions: [
              TextButton(
                  onPressed: () {
                    clearBlocks();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Play Again!',
                    style: textStyle20,
                  ))
            ],
          );
        });
  }

  void showDialogBox(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Match Winner is:-  \' $winner \''),
            actions: [
              TextButton(
                  onPressed: () {
                    clearBlocks();
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Play Again!',
                    style: textStyle20,
                  ))
            ],
          );
        });
    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
  }

  void restart() {
    setState(() {
      oScore = 0;
      xScore = 0;
      oTurn = true;
    });
    clearBlocks();
  }

  void clearBlocks() {
    setState(() {
      for (int i = 0; i < 16; i++) {
        dispXO[i] = '';
      }
    });
    filledBox = 0;
  }
}
