import 'package:flutter/material.dart';

int x = 0;
int y = 0;

//Generates initial board
//Needs to account for different halves
List<List<String>> grid = new List.generate(9, (i) => new List(5));
void generateBoard(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      grid[i][j] = "o";
    }
  }
}

void playerSpawn(){
  grid[0][2] = "x";
  x = 0;
  y = 2;
}

//To be implemented to find play position potentially replacing x and y variables
bool playerLocation(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(grid[i][j] == "x"){
        x = i;
        y = j;
        return true;
      }
    }
  }
  return false;
}

void main(){
  generateBoard();
  playerSpawn();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '2D Array',
      home: MyHomePage(title: 'Main'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Move functions move the player based on direction of function
  //Replaces previous spot player was on with o, changes new tile player is on to x
  //x and y are currently reversed due to a mistake in representing the x and y axis
  //Changing x value moves up and down, y moves right to left
  void moveUp(){
    setState(() {
      grid[x][y] = "o";
      grid[x+1][y] = "x";
      playerLocation();
    });
  }

  void moveDown(){
    setState(() {
      grid[x][y] = "o";
      grid[x-1][y] = "x";
      playerLocation();
    });
  }

  void moveLeft(){
    setState(() {
      grid[x][y] = "o";
      grid[x][y+1] = "x";
      playerLocation();
    });
  }

  void moveRight(){
    setState(() {
      grid[x][y] = "o";
      grid[x][y-1] = "x";
      playerLocation();
    });
  }

  //Gives the board a (temporary) way of viewing the layout
  String board2String(){
    String board = "";
    for (int i = 8; i >= 0; i--) {
      for (int j = 4; j >= 0; j--) {
        board += grid[i][j] + "  ";
      }
      board += "\n";
    }
    return board;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(board2String(),
                textScaleFactor: 2.0, //Changes the font size  better way?
              ),
              FlatButton(
                onPressed: moveUp,
                child: Column(
                  children: <Widget>[
                    Icon(Icons.keyboard_arrow_up),
                    Text("Move Up")
                  ],
                ),
              ),
              Row(  //Contains move buttons left, down, and up displayed like keyboard arrow keys
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                FlatButton( //Left Button
                  onPressed: moveLeft,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_left),
                      Text("Move Left")
                    ],
                  ),
                ),
                FlatButton( //Down Button
                  onPressed: moveDown,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_down),
                      Text("Move Down")
                    ],
                  ),
                ),
                FlatButton( //Right Button
                  onPressed: moveRight,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_right),
                      Text("Move Right")
                    ],
                  ),
                ),
                ],
              ),
            ],
          ),
        ),
    );
  }

}