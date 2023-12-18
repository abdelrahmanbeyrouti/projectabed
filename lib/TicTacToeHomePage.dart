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
        backgroundColor: Colors.purple[100], // Change to your preferred color
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/008/143/625/small_2x/seamless-pattern-with-gaming-icons-free-vector.jpg'),
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
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,// Increase the font size
                ),
              ),
              SizedBox(height: 40.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/game');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow, // Change to your preferred color
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
                'Siuuuuuuuu',
                style: TextStyle(
                  color: Colors.teal[200], // Change to your preferred color
                  fontSize: 32.0, // Increase the font size
                  fontWeight: FontWeight.bold, // Change to your preferred font weight
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
