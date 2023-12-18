

import 'package:flutter/material.dart';
import 'TicTacToeHomePage.dart';
import 'TicTacToeGamePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TicTacToeHomePage(),
        '/game': (context) => TicTacToeGamePage(),
      },
    );
  }
}
