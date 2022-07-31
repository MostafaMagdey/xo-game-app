import 'package:flutter/material.dart';
import 'package:xogame/bord_screen.dart';

import 'login_screen.dart';

void main() {
  runApp(MyAPP());
}

class MyAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: LoginScreen.routName,
      routes: {
        BordScreen.routeName: (context) => BordScreen(),
        LoginScreen.routName: (context) => LoginScreen(),
      },
    );
  }
}
