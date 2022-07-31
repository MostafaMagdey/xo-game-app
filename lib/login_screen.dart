import 'package:flutter/material.dart';
import 'package:xogame/bord_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routName = 'LoginScreen';
  String Player1Name = '';
  String Player2Name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' login Screen To play X-O Game'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onChanged: (text) {
                Player1Name = text;
              },
              decoration: InputDecoration(labelText: 'Player 1'),
            ),
            TextField(
              onChanged: (text) {
                Player2Name = text;
              },
              decoration: InputDecoration(labelText: 'Player 2'),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, BordScreen.routeName,
                      arguments: BordScreenArguments(
                          Player1Name: Player1Name, Player2Name: Player2Name));
                },
                child: Text('Play'))
          ],
        ),
      ),
    );
  }
}
