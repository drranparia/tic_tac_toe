import 'package:flutter/material.dart';
import 'package:tic_tac_toe/classes/colors.dart';

import '../classes/textStyles.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool oTurn = true;
  List<String> dispXO = ['', '', '', '', '', '', '', '', ''];
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
          'Tic Tac Toe',
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
                      const SizedBox(
                        height: 10,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        xScore.toString(),
                        style: playerStats,
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
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
                      backgroundColor: MaterialStateProperty.all(AColor.white),
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
      )),
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
    if (dispXO[0] == dispXO[1] && dispXO[0] == dispXO[2] && dispXO[0] != '') {
      showDialogBox(dispXO[0]);
    }
    //2nd ROW
    else if (dispXO[3] == dispXO[4] &&
        dispXO[3] == dispXO[5] &&
        dispXO[3] != '') {
      showDialogBox(dispXO[3]);
    }
    //3rd ROW
    else if (dispXO[6] == dispXO[7] &&
        dispXO[6] == dispXO[8] &&
        dispXO[6] != '') {
      showDialogBox(dispXO[6]);
    }
    //1st COLUMN
    else if (dispXO[0] == dispXO[3] &&
        dispXO[0] == dispXO[6] &&
        dispXO[0] != '') {
      showDialogBox(dispXO[0]);
    }
    //2nd COLUMN
    else if (dispXO[1] == dispXO[4] &&
        dispXO[1] == dispXO[7] &&
        dispXO[1] != '') {
      showDialogBox(dispXO[1]);
    }
    //3rd COLUMN
    else if (dispXO[2] == dispXO[5] &&
        dispXO[2] == dispXO[8] &&
        dispXO[2] != '') {
      showDialogBox(dispXO[2]);
    }
    //1st DIAGONAL
    else if (dispXO[0] == dispXO[4] &&
        dispXO[0] == dispXO[8] &&
        dispXO[0] != '') {
      showDialogBox(dispXO[0]);
    }
    //2nd DIAGONAL
    else if (dispXO[2] == dispXO[4] &&
        dispXO[2] == dispXO[6] &&
        dispXO[2] != '') {
      showDialogBox(dispXO[2]);
    }

    //DRAW
    else if (filledBox == 9) {
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

  void clearBlocks() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        dispXO[i] = '';
      }
    });
    filledBox = 0;
  }

  void restart() {
    setState(() {
      oScore = 0;
      xScore = 0;
      oTurn = true;
    });
    clearBlocks();
  }
}
