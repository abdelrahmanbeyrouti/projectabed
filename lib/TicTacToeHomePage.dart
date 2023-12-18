import 'package:flutter/material.dart';

class TicTacToeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tic Tac Toe Fun!',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.pinkAccent, //
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://i.pinimg.com/736x/0a/f6/00/0af600cebaa64381828fc2b71321d066.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to the Fun World of Tic Tac Toe!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Challenge your friend and enjoy the game!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0, //
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, //
                  padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 60.0),
                  textStyle: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text('Play Now'),
              ),
              SizedBox(height: 20.0),
              Text(
                'Siuuuuu',
                style: TextStyle(
                  color: Colors.teal, //
                  fontSize: 32.0, //
                  fontWeight: FontWeight.bold, //
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

