import 'package:flutter/material.dart';

class BordHedear extends StatelessWidget {
  int Player1Score;
  int Player2Score;
  String Player1Name;
  String Player2Name;

  BordHedear(
      this.Player1Score, this.Player2Score, this.Player1Name, this.Player2Name);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('$Player1Name(X)', style: TextStyle(fontSize: 24)),
              Text('$Player2Name(O)', style: TextStyle(fontSize: 24)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Score: $Player1Score',
                style: TextStyle(fontSize: 22),
              ),
              Text(
                'Score: $Player2Score',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
