import 'package:flutter/material.dart';
import 'package:tic_tac_toe/xoButton.dart';
import 'colors.dart';
import 'game_logic.dart';
import 'loginScreen.dart'; // Import the logic file

class Game extends StatefulWidget {
  static const String routeName = "Game";

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  final GameLogic gameLogic = GameLogic(); // Instance of GameLogic

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    // Extract player names
    gameLogic.player1 = args?['player1'] ?? 'Player 1';
    gameLogic.player2 = args?['player2'] ?? 'Player 2';

    return Scaffold(
      backgroundColor:  AppColors.darkblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.grey,
        centerTitle: true,
        title: const Text("X O",
            style: TextStyle(fontSize: 36, color: Colors.black)),
      ),
      body: Column(
        children: [
          // Player Scores and Winner Display
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(gameLogic.player1,
                        style: const TextStyle(
                            fontSize: 24, color: AppColors.sky)),
                    Text(gameLogic.PlayerOneScore,
                        style: const TextStyle(
                            fontSize: 24, color:  AppColors.sky)),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(gameLogic.player2,
                        style: const TextStyle(
                            fontSize: 24, color:  AppColors.sky)),
                    Text(gameLogic.PlayerTwoScore,
                        style: const TextStyle(
                            fontSize: 24, color:  AppColors.sky)),
                  ],
                ),
              ],
            ),
          ),
          // Display Winner
          if (gameLogic.winnerMessage.isNotEmpty)
            Text(
              gameLogic.winnerMessage,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          // Game Grid
          for (int row = 0; row < 3; row++)
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: List.generate(3, (col) {
                  int index = row * 3 + col;
                  return xoButton(
                    letter: gameLogic.theGrid[index],
                    index: index,
                    onClickButton: (i) => onButtonClicked(i),
                  );
                }),
              ),
            ),
        ],
      ),
    );
  }

  void onButtonClicked(int index) {
    setState(() {
      gameLogic.handleButtonClick(
          index, context, resetGame, () => Navigator.of(context).pushReplacementNamed(Login.routeName));
    });
  }

  void resetGame() {
    setState(() {
      gameLogic.resetGame(context);
    });
  }
}
