import 'package:flutter/material.dart';
import 'package:the_mystic_woodv3/pictoarrary.dart';

int x = 0;
int y = 0;

List<String> yellow = new List(21);
List<String> pink = new List(21);

void randomize(){
  for (int i = 0; i < yellow.length; i++){
    yellow[i] = 'asset/yellow/' + (i+1).toString() + '.png';
    pink[i] = 'asset/pink/' + (i+1).toString() + '.png';
  }
  yellow.shuffle();
  pink.shuffle();
}

// Assigns images to values in the original grid/String array
List<pictoarray> images = new List(45);
void createImages() {
  int k = 0;
  int p = 0;
  int y = 0;

  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if (grid[i][j] == "y"){
        images[k] = new pictoarray(j, i, yellow[y], grid[i][j]);
        k++;
        y++;
      }
      else if (grid[i][j] == "p"){
        images[k] = new pictoarray(j, i, pink[p], grid[i][j]);
        k++;
        p++;
      }
      else if (grid[i][j] == "A"){
        images[k] = new pictoarray(j, i, 'asset/yellow/Gate.png', grid[i][j]);
        k++;
      }
      else if (grid[i][j] == "N"){
        images[k] = new pictoarray(j, i, 'asset/pink/Gate.png', grid[i][j]);
        k++;
      }
      else if (grid[i][j] == "T"){
        images[k] = new pictoarray(j, i, 'asset/Tower.png', grid[i][j]);
        k++;
      }
      else{
        images[k] = new pictoarray(j, i, 'asset/06.jpg', grid[i][j]);
        k++;
      }
    }
  }
}

//Generates initial board
List<List<String>> grid = new List.generate(9, (i) => new List(5));
void generateBoard(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(i == 4 && j == 2){ // Tower location
        grid[i][j] = "T";
      }
      else if(i == 0 && j == 2){ // Earthly Gate Location
        grid[i][j] = "A";
      }
      else if(i == 8 && j == 2){ // Enchanted Gate Location
        grid[i][j] = "N";
      }
      else if(i < 4){ // Sets bottom of board to yellow(Earthly) tiles
        grid[i][j] = "y";
      }
      else if(i > 4){ // Sets top of board to pink(Enchanted) tiles
        grid[i][j] = "p";
      }
      else if(i == 4 && j > 2){ // Makes tiles to left of tower pink(Enchanted)
        grid[i][j] = "p";
      }
      else if(i == 4 && j < 2){ // Makes tiles to right of tower yellow(Earthly)
        grid[i][j] = "y";
      }
      else{ // Makes a dash if mistake occurs
        grid[i][j] = "-";
      }
    }
  }
}

void playerSpawn(){
  grid[0][2] = "x";
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
  randomize();
  createImages();
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
      grid[y][x] = "T";
    }
    else if(y == 0 && x == 2){ // Earthly Gate Location
      grid[y][x] = "A";
    }
    else if(y == 8 && x == 2){ // Enchanted Gate Location
      grid[y][x] = "N";
    }
    else if(y < 4){ // Sets bottom of board to yellow(Earthly) tiles
      grid[y][x] = "y";
    }
    else if(y > 4){ // Sets top of board to pink(Enchanted) tiles
      grid[y][x] = "p";
    }
    else if(y == 4 && x > 2){ // Makes tiles to left of tower pink(Enchanted)
      grid[y][x] = "p";
    }
    else if(y == 4 && x < 2){ // Makes tiles to right of tower yellow(Earthly)
      grid[y][x] = "y";
    }
    else{ // Makes a dash if mistake occurs
      grid[y][x] = "-";
    }
  }

  // TODO: implement a way for the board letters to be replaced by images
  // Not currently in use/May not be needed
  List<String> image2Board(){
    List<String> test = new List(45);
    //int k = 0;
    for (int i = 0; i < images.length; i++) {
      test[i] = images[i].getImageURL();
    }
    return test;
  }
  //Move functions move the player based on direction of function
  //Replaces previous spot player was on with o, changes new tile player is on to x
  //x and y should be fixed
  //Changing y value moves up and down, x moves right or left
  void moveUp(){
    setState(() {
      setTile();
      grid[y+1][x] = "x";
      playerLocation();
    });
  }

  void moveDown(){
    setState(() {
      setTile();
      grid[y-1][x] = "x";
      playerLocation();
    });
  }

  void moveLeft(){
    setState(() {
      setTile();
      grid[y][x+1] = "x";
      playerLocation();
    });
  }

  void moveRight(){
    setState(() {
      setTile();
      grid[y][x-1] = "x";
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

  // TODO: Tidy up code a bit. Possibly break up into smaller functions.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              buildBoard(),
              //buttons(),
            ],
        ),
      ),
    );
  }


  Widget buildBoard() {
    return Expanded(child: GridView.count(
      primary: false,
      crossAxisCount: 5,
      childAspectRatio: 900.0 / 586.0,
      children: <Widget>[
        //Stack(
          //children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[44].getImageURL());
              }));
            },
            child: Image.asset(images[44].getImageURL())
          ),

          //],
        //),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[43].getImageURL());
              }));
            },
            child: Image.asset(images[43].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[42].getImageURL());
              }));
            },
            child: Image.asset(images[42].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[41].getImageURL());
              }));
            },
            child: Image.asset(images[41].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[40].getImageURL());
              }));
            },
            child: Image.asset(images[40].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[39].getImageURL());
              }));
            },
            child: Image.asset(images[39].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[38].getImageURL());
              }));
            },
            child: Image.asset(images[38].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[37].getImageURL());
              }));
            },
            child: Image.asset(images[37].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[36].getImageURL());
              }));
            },
            child: Image.asset(images[36].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[35].getImageURL());
              }));
            },
            child: Image.asset(images[35].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[34].getImageURL());
              }));
            },
            child: Image.asset(images[34].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[33].getImageURL());
              }));
            },
            child: Image.asset(images[33].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[32].getImageURL());
              }));
            },
            child: Image.asset(images[32].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[31].getImageURL());
              }));
            },
            child: Image.asset(images[31].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[30].getImageURL());
              }));
            },
            child: Image.asset(images[30].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[29].getImageURL());
              }));
            },
            child: Image.asset(images[29].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[28].getImageURL());
              }));
            },
            child: Image.asset(images[28].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[27].getImageURL());
              }));
            },
            child: Image.asset(images[27].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[26].getImageURL());
              }));
            },
            child: Image.asset(images[26].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[25].getImageURL());
              }));
            },
            child: Image.asset(images[25].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[24].getImageURL());
              }));
            },
            child: Image.asset(images[24].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[23].getImageURL());
              }));
            },
            child: Image.asset(images[23].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[22].getImageURL());
              }));
            },
            child: Image.asset(images[22].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[21].getImageURL());
              }));
            },
            child: Image.asset(images[21].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[20].getImageURL());
              }));
            },
            child: Image.asset(images[20].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[19].getImageURL());
              }));
            },
            child: Image.asset(images[19].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[18].getImageURL());
              }));
            },
            child: Image.asset(images[18].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[17].getImageURL());
              }));
            },
            child: Image.asset(images[17].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[16].getImageURL());
              }));
            },
            child: Image.asset(images[16].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[15].getImageURL());
              }));
            },
            child: Image.asset(images[15].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[14].getImageURL());
              }));
            },
            child: Image.asset(images[14].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[13].getImageURL());
              }));
            },
            child: Image.asset(images[13].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[12].getImageURL());
              }));
            },
            child: Image.asset(images[12].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[11].getImageURL());
              }));
            },
            child: Image.asset(images[11].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[10].getImageURL());
              }));
            },
            child: Image.asset(images[10].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[9].getImageURL());
              }));
            },
            child: Image.asset(images[9].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[8].getImageURL());
              }));
            },
            child: Image.asset(images[8].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[7].getImageURL());
              }));
            },
            child: Image.asset(images[7].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[6].getImageURL());
              }));
            },
            child: Image.asset(images[6].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[5].getImageURL());
              }));
            },
            child: Image.asset(images[5].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[4].getImageURL());
              }));
            },
            child: Image.asset(images[4].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[3].getImageURL());
              }));
            },
            child: Image.asset(images[3].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[2].getImageURL());
              }));
            },
            child: Image.asset(images[2].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[1].getImageURL());
              }));
            },
            child: Image.asset(images[1].getImageURL())
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[0].getImageURL());
              }));
            },
            child: Image.asset(images[0].getImageURL())
        ),
        ],
      ),
    );
  }


   Widget buttons(){
      return Column(
        children: <Widget> [
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
      );
   }
}
class DetailScreen extends StatefulWidget {
  final String url;

  DetailScreen({Key key, @required this.url})
      : assert(url != null),
        super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Image.asset(widget.url),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
