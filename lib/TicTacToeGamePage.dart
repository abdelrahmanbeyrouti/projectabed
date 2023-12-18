import 'package:flutter/material.dart';

class TicTacToeGamePage extends StatefulWidget {
  @override
  _TicTacToeGamePageState createState() => _TicTacToeGamePageState();
}

class _TicTacToeGamePageState extends State<TicTacToeGamePage> {
  List<String> _board = List.filled(9, ''); // Flat list to represent the 3x3 board
  bool _isPlayerX = true; // true for X, false for O
  int _scoreX = 0;
  int _scoreO = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe Game'),
        backgroundColor: Color(0xFFE57373), // Set the AppBar color
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE57373), Color(0xFF64B5F6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildScore(),
              SizedBox(height: 20),
              _buildBoard(),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _restartGame,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.greenAccent,
                    ),
                    child: Text('Restart Game'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: _restartScore,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.redAccent,
                    ),
                    child: Text('Restart Score'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScore() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SCORE : ',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            'X: $_scoreX',
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          SizedBox(width: 20),
          Text(
            'O: $_scoreO',
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoard() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: _board.length,
        itemBuilder: (context, index) {
          return _buildTile(index);
        },
      ),
    );
  }

  Widget _buildTile(int index) {
    return GestureDetector(
      onTap: () => _onCellTapped(index),
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: _buildIcon(index),
      ),
    );
  }

  Widget _buildIcon(int index) {
    if (_board[index] == 'X') {
      return Icon(
        Icons.close,
        size: 50,
        color: Colors.blue,
      );
    } else if (_board[index] == 'O') {
      return Icon(
        Icons.circle,
        size: 50,
        color: Colors.red,
      );
    } else {
      return SizedBox.shrink();
    }
  }

  void _onCellTapped(int index) {
    if (_board[index].isEmpty) {
      setState(() {
        _board[index] = _isPlayerX ? 'X' : 'O';
        if (_checkForWin()) {
          _isPlayerX ? _scoreX++ : _scoreO++;
          _showWinnerDialog(_isPlayerX ? 'X' : 'O');
          _restartGame();
        } else if (_checkForDraw()) {
          _restartGame();
        } else {
          _isPlayerX = !_isPlayerX;
        }
      });
    }
  }

  bool _checkForWin() {
    // Check rows, columns, and diagonals for a win
    for (int i = 0; i < 3; i++) {
      if (_board[i * 3] == _board[i * 3 + 1] &&
          _board[i * 3 + 1] == _board[i * 3 + 2] &&
          _board[i * 3].isNotEmpty) {
        return true; // Check rows
      }
      if (_board[i] == _board[i + 3] &&
          _board[i + 3] == _board[i + 6] &&
          _board[i].isNotEmpty) {
        return true; // Check columns
      }
    }
    if (_board[0] == _board[4] && _board[4] == _board[8] && _board[0].isNotEmpty) {
      return true; // Check diagonal from top-left to bottom-right
    }
    if (_board[2] == _board[4] && _board[4] == _board[6] && _board[2].isNotEmpty) {
      return true; // Check diagonal from top-right to bottom-left
    }
    return false;
  }

  bool _checkForDraw() {
    if (!_board.contains('')) {
      _showDrawDialog();
      _restartGame();
      return true;
    }
    return false;
  }

  void _restartGame() {
    setState(() {
      _board = List.filled(9, ''); // Reset the board
      _isPlayerX = true; // Reset the player turn
    });
  }

  void _restartScore() {
    setState(() {
      _scoreX = 0; // Reset the score for X
      _scoreO = 0; // Reset the score for O
    });
  }

  void _showWinnerDialog(String winner) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Game Over'),
        content: Text('$winner wins!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('DRAW'),
        content: Text('It\'s a draw!'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TicTacToeGamePage(),
  ));
}


