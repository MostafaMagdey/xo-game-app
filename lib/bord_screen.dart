import 'package:flutter/material.dart';

import 'board_button.dart';
import 'bord_hedear.dart';

class BordScreen extends StatefulWidget {
  static const String routeName = 'bord';

  const BordScreen({Key? key}) : super(key: key);

  @override
  State<BordScreen> createState() => _BordScreenState();
}

class _BordScreenState extends State<BordScreen> {
  String btn1Text = '';
  List<String> boardStatus = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)?.settings.arguments as BordScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My (x-o Game)',
          style: TextStyle(fontSize: 24),
        ),
      ),
      body: Column(
        children: [
          BordHedear(
              Plaer1Scor, Plaer2Scor, args.Player1Name, args.Player2Name),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BordButton(boardStatus[0], onButonClik, 0),
                BordButton(boardStatus[1], onButonClik, 1),
                BordButton(boardStatus[2], onButonClik, 2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BordButton(boardStatus[3], onButonClik, 3),
                BordButton(boardStatus[4], onButonClik, 4),
                BordButton(boardStatus[5], onButonClik, 5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BordButton(boardStatus[6], onButonClik, 6),
                BordButton(boardStatus[7], onButonClik, 7),
                BordButton(boardStatus[8], onButonClik, 8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  int Plaer1Scor = 0;
  int Plaer2Scor = 0;

  void onButonClik(int index) {
    if (boardStatus[index].isNotEmpty) {
      return;
    }
    if (counter % 2 == 0) {
      boardStatus[index] = 'X';
      Plaer1Scor += 5;
    } else {
      boardStatus[index] = 'O';
      Plaer2Scor += 5;
    }
    counter++;
    setState(() {});
    if (checkWinner('X')) {
      Plaer1Scor++;
      resetBord();
    } else if (checkWinner('O')) {
      Plaer2Scor++;
      resetBord();
    } else if (counter == 9) {
      resetBord();
    }
  }

  void resetBord() {
    boardStatus = [
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    counter = 0;
    setState(() {});
  }

  bool checkWinner(String playerSymbol) {
    for (int i = 0; i < 9; i += 3) {
      if (boardStatus[i] == playerSymbol &&
          boardStatus[i + 1] == playerSymbol &&
          boardStatus[i + 2] == playerSymbol) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardStatus[i] == playerSymbol &&
          boardStatus[i + 3] == playerSymbol &&
          boardStatus[i + 6] == playerSymbol) {
        return true;
      }
    }
    if (boardStatus[0] == playerSymbol &&
        boardStatus[4] == playerSymbol &&
        boardStatus[8] == playerSymbol) {
      return true;
    }
    if (boardStatus[2] == playerSymbol &&
        boardStatus[4] == playerSymbol &&
        boardStatus[6] == playerSymbol) {
      return true;
    }
    return false;
  }
}

class BordScreenArguments {
  String Player1Name;
  String Player2Name;

  BordScreenArguments({required this.Player1Name, required this.Player2Name});
}
