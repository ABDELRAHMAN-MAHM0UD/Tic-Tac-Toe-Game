import 'package:flutter/material.dart';
import 'colors.dart';
import 'game_logic.dart';
import 'Game_UI.dart';

class Login extends StatefulWidget {
  static const String routeName = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GameLogic _gameLogic = GameLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.grey,
        title: Text(
          "X O",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xff000000),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Player 1 TextField
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Player One Name (X)",
                labelStyle: TextStyle(color: AppColors.sky),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.sky),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.sky),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) {
                _gameLogic.setPlayer1Name(text);
              },
            ),
            SizedBox(height: 20),

            // Player 2 TextField
            TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "Player Two Name (O)",
                labelStyle: TextStyle(color: AppColors.sky),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.sky),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.sky),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onChanged: (text) {
                _gameLogic.setPlayer2Name(text);
              },
            ),
            SizedBox(height: 40),

            // Play Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  Game.routeName,
                  arguments: _gameLogic.getPlayers(),
                );
              },
              child: Text(
                "Play !",
                style: TextStyle(fontSize: 20, color: Color(0xffFEFAE0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
