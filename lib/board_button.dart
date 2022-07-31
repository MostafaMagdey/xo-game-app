import 'package:flutter/material.dart';

class BordButton extends StatelessWidget {
  String text;
  Function onBtnCliked;
  int index;

  BordButton(this.text, this.onBtnCliked, this.index);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onBtnCliked(index);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 30),
            )));
  }
}
