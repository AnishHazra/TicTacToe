import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  // final xImg = Image.asset("assets/image/Player 1.png");
  // final oImg = Image.asset("assets/image/Player 2.png");
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool winnerFound = false;
  String result = "";
  static var customFontWhite = GoogleFonts.coiny(
    textStyle: const TextStyle(
      color: Colors.black,
      letterSpacing: 3,
      fontSize: 28,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Player O",
                            style: customFontWhite,
                          ),
                          Text(
                            oScore.toString(),
                            style: customFontWhite,
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Player X",
                            style: customFontWhite,
                          ),
                          Text(
                            xScore.toString(),
                            style: customFontWhite,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              width: 5,
                              color: Colors.black,
                            ),
                            color: MainColor.cyanColor),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.coiny(
                              textStyle: TextStyle(
                                  fontSize: 64, color: MainColor.blueColor),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  result,
                  style: customFontWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    //2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        result = 'Player${displayXO[3]} Wins!';
        _updateScore(displayXO[3]);
      });
    }
    //3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        result = 'Player${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
      });
    }
    //1st col
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    //2nd col
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        result = 'Player${displayXO[1]} Wins!';
        _updateScore(displayXO[1]);
      });
    }
    //3rd col
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player${displayXO[2]} Wins!';
        _updateScore(displayXO[2]);
      });
    }
    //check diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player${displayXO[0]} Wins!';
        _updateScore(displayXO[0]);
      });
    }
    //check diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        result = 'Player${displayXO[6]} Wins!';
        _updateScore(displayXO[6]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        result = "Nobody Wins!";
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }
}
