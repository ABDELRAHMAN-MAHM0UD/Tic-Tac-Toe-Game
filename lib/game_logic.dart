import 'package:flutter/material.dart';

class GameLogic {
  List<String> theGrid = ["", "", "", "", "", "", "", "", ""];
  String PlayerOneScore = '0', PlayerTwoScore = '0';
  String winnerMessage = '';
  String player1 = '';
  String player2 = '';
  int counter = 0;


  void setPlayer1Name(String name) {
    player1 = name;
  }

  void setPlayer2Name(String name) {
    player2 = name;
  }

  Map<String, String> getPlayers() {
    return {'player1': player1, 'player2': player2};
  }

  void handleButtonClick(int index, BuildContext context, VoidCallback resetGame, VoidCallback navigateBack) {
    if (theGrid[index] == "") {
      theGrid[index] = counter % 2 == 0 ? "X" : "O";
      counter++;

      if (checkWinner()) {
        // Winner dialog
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Congratulations!"),
            content: Text(winnerMessage),
            actions: [
              TextButton(onPressed: resetGame, child: const Text("Replay")),
              TextButton(onPressed: navigateBack, child: const Text("New Game")),
            ],
          ),
        );
      } else if (isDraw()) {
        // Draw dialog
        winnerMessage = "It's a Draw!";
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text("Game Over"),
            content: Text(winnerMessage),
            actions: [
              TextButton(onPressed: resetGame, child: const Text("Replay")),
              TextButton(onPressed: navigateBack, child: const Text("New Game")),
            ],
          ),
        );
      }
    }
  }

  bool checkWinner() {
    for (int i = 0; i < 9; i += 3) {
      if (theGrid[i] == theGrid[i + 1] && theGrid[i + 1] == theGrid[i + 2] && theGrid[i] != "") {
        updateWinner([i, i + 1, i + 2]);
        return true;
      }
    }

    for (int i = 0; i < 3; i++) {
      if (theGrid[i] == theGrid[i + 3] && theGrid[i + 3] == theGrid[i + 6] && theGrid[i] != "") {
        updateWinner([i, i + 3, i + 6]);
        return true;
      }
    }

    if (theGrid[0] == theGrid[4] && theGrid[4] == theGrid[8] && theGrid[0] != "") {
      updateWinner([0, 4, 8]);
      return true;
    }

    if (theGrid[2] == theGrid[4] && theGrid[4] == theGrid[6] && theGrid[2] != "") {
      updateWinner([2, 4, 6]);
      return true;
    }

    return false;
  }

  bool isDraw() {
    // Check if all cells are filled and no winner
    return theGrid.every((cell) => cell.isNotEmpty) && winnerMessage.isEmpty;
  }

  void updateWinner(List<int> winningIndices) {
    for (int i in winningIndices) {
      theGrid[i] = theGrid[i].toUpperCase();
    }
    winnerMessage = "${counter % 2 == 0 ? player2 : player1} Wins!";
    if (counter % 2 == 0) {
      PlayerTwoScore = (int.parse(PlayerTwoScore) + 1).toString();
    } else {
      PlayerOneScore = (int.parse(PlayerOneScore) + 1).toString();
    }
  }

  void resetGame(BuildContext context) {
    theGrid = ["", "", "", "", "", "", "", "", ""];
    counter = 0;
    winnerMessage = '';
    Navigator.pop(context);
  }
}
