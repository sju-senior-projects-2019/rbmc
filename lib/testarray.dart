import 'package:flutter/material.dart';

int x = 0;
int y = 0;

//Generates initial board
List<List<String>> grid = new List.generate(9, (i) => new List(5));
void generateBoard(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(i == 4 && j == 2){ // Tower location
        grid[i][j] = 'asset/05.jpg';
      }
      else if(i == 0 && j == 2){ // Earthly Gate Location
        grid[i][j] = 'asset/04.jpg';
      }
      else if(i == 8 && j == 2){ // Enchanted Gate Location
        grid[i][j] = 'asset/02.jpg';
      }
      else if(i < 4){ // Sets bottom of board to yellow(Earthly) tiles
        grid[i][j] = 'asset/00.png';
      }
      else if(i > 4){ // Sets top of board to pink(Enchanted) tiles
        grid[i][j] = 'asset/00.png';
      }
      else if(i == 4 && j > 2){ // Makes tiles to left of tower pink(Enchanted)
        grid[i][j] = 'asset/00.png';
      }
      else if(i == 4 && j < 2){ // Makes tiles to right of tower yellow(Earthly)
        grid[i][j] = 'asset/00.png';
      }
      else{ // Makes a dash if mistake occurs
        grid[i][j] = "-";
      }
    }
  }
}

void playerSpawn(){
  grid[0][2] = 'asset/pctest.jpg';
  x = 2;
  y = 0;
}

//To be implemented to find play position potentially replacing x and y variables
bool playerLocation(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(grid[i][j] == 'asset/pctest.jpg'){
        x = j;
        y = i;
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
  // setTile returns the tile the player moved from to the previous letter
  // Certain locations are set while others are just a color based on position
  // on board
  void setTile(){
    if(y == 4 && x == 2){ // Tower location
      grid[y][x] = 'asset/05.jpg';
    }
    else if(y == 0 && x == 2){ // Earthly Gate Location
      grid[y][x] = 'asset/04.jpg';
    }
    else if(y == 8 && x == 2){ // Enchanted Gate Location
      grid[y][x] = 'asset/02.jpg';
    }
    else if(y < 4){ // Sets bottom of board to yellow(Earthly) tiles
      grid[y][x] = 'asset/00.png';
    }
    else if(y > 4){ // Sets top of board to pink(Enchanted) tiles
      grid[y][x] = 'asset/00.png';
    }
    else if(y == 4 && x > 2){ // Makes tiles to left of tower pink(Enchanted)
      grid[y][x] = 'asset/00.png';
    }
    else if(y == 4 && x < 2){ // Makes tiles to right of tower yellow(Earthly)
      grid[y][x] = 'asset/00.png';
    }
    else{ // Makes a dash if mistake occurs
      grid[y][x] = "-";
    }
  }
  //Move functions move the player based on direction of function
  //Replaces previous spot player was on with o, changes new tile player is on to x
  //x and y should be fixed
  //Changing y value moves up and down, x moves right or left
  void moveUp(){
    setState(() {
      setTile();
      grid[y+1][x] = 'asset/pctest.jpg';
      playerLocation();
    });
  }

  void moveDown(){
    setState(() {
      setTile();
      grid[y-1][x] = 'asset/pctest.jpg';
      playerLocation();
    });
  }

  void moveLeft(){
    setState(() {
      setTile();
      grid[y][x+1] = 'asset/pctest.jpg';
      playerLocation();
    });
  }

  void moveRight(){
    setState(() {
      setTile();
      grid[y][x-1] = 'asset/pctest.jpg';
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
            Image.asset(board2String()
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