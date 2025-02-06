import 'package:flutter/material.dart';
import 'Game_UI.dart';
import 'loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Login.routeName,
      routes: {
        Game.routeName: (_) => Game(),
        Login.routeName: (_) => Login()
      },

      ///Game(Player1: "Player1", Player2: "Player2"),
    );
  }
}
