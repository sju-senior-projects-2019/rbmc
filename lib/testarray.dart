import 'package:flutter/material.dart';
import 'package:the_mystic_woodv3/gametiles.dart';

int x = 0;
int y = 0;

//Generates initial board
List<List<GameTile>> grid = new List.generate(9, (i) => new List(5));
void generateBoard(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(i == 4 && j == 2){ // Tower location
        grid[i][j] = new GameTile('asset/00.jpg', '0');
      }
      else if(i == 0 && j == 2){ // Earthly Gate Location
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
      else if(i == 8 && j == 2){ // Enchanted Gate Location
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
      else if(i < 4){ // Sets bottom of board to yellow(Earthly) tiles
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
      else if(i > 4){ // Sets top of board to pink(Enchanted) tiles
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
      else if(i == 4 && j > 2){ // Makes tiles to left of tower pink(Enchanted)
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
      else if(i == 4 && j < 2){ // Makes tiles to right of tower yellow(Earthly)
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
      else{ // Makes a dash if mistake occurs
        grid[i][j] = GameTile('asset/00.jpg', '0');
      }
    }
  }
}

void playerSpawn(){
  grid[0][2] = "x" as GameTile;
  x = 2;
  y = 0;
}

//To be implemented to find play position potentially replacing x and y variables
bool playerLocation(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(grid[i][j] == "x"){
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
      grid[y][x] = GameTile('asset/00.jpg', '0');
    }
    else if(y == 0 && x == 2){ // Earthly Gate Location
      grid[y][x] = new GameTile('asset/01.jpg', '1');
    }
    else if(y == 8 && x == 2){ // Enchanted Gate Location
      grid[y][x] = new GameTile('asset/02.jpg', '2');
    }
    else if(y < 4){ // Sets bottom of board to yellow(Earthly) tiles
      grid[y][x] = new GameTile('asset/03.jpg', '3');
    }
    else if(y > 4){ // Sets top of board to pink(Enchanted) tiles
      grid[y][x] = new GameTile('asset/04.jpg', '4');
    }
    else if(y == 4 && x > 2){ // Makes tiles to left of tower pink(Enchanted)
      grid[y][x] = new GameTile('asset/05.jpg', '5');
    }
    else if(y == 4 && x < 2){ // Makes tiles to right of tower yellow(Earthly)
      grid[y][x] = new GameTile('asset/06.jpg', '6');
    }
    else{ // Makes a dash if mistake occurs
      grid[y][x] = GameTile('asset/00.jpg', '0');
    }
  }
  //Move functions move the player based on direction of function
  //Replaces previous spot player was on with o, changes new tile player is on to x
  //x and y should be fixed
  //Changing y value moves up and down, x moves right or left
  void moveUp(){
    setState(() {
      setTile();
      grid[y+1][x] = "x" as GameTile;
      playerLocation();
    });
  }

  void moveDown(){
    setState(() {
      setTile();
      grid[y-1][x] = "x" as GameTile;
      playerLocation();
    });
  }

  void moveLeft(){
    setState(() {
      setTile();
      grid[y][x+1] = "x" as GameTile;
      playerLocation();
    });
  }

  void moveRight(){
    setState(() {
      setTile();
      grid[y][x-1] = "x" as GameTile;
      playerLocation();
    });
  }

  //Gives the board a (temporary) way of viewing the layout
  /*String board2String(){
    String board = "";
    for (int i = 8; i >= 0; i--) {
      for (int j = 4; j >= 0; j--) {
        board += grid[i][j] + "  ";
      }
      board += "\n";
    }
    return board;
  }*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
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
        ),
    );
  }

}