import 'package:flutter/material.dart';

int x = 0;
int y = 0;

List<List<bool>> grid = new List.generate(9, (i) => new List(5));
void generateBoard(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      grid[i][j] = false;
    }
  }
}

void playerSpawn(){
  grid[0][0] = true;
}

bool playerLocation(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(grid[i][j] == true){
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
      home: MyHomePage(title: 'Main'),/*Scaffold(
        appBar: AppBar(
          title: Text('Board 2D Array'),
        ),
        body: Center(
          child: Text("The player is currently at " + x.toString() + ", " +
              y.toString() + "."),
        ),
      ),*/
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
  void moveUp(){
    setState(() {
      grid[x][y] = false;
      grid[x][y+1] = true;
      playerLocation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Text("The player is currently at " + x.toString() + ", " +
              y.toString() + "."),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: moveUp,
        tooltip: 'Move Up',
        child: Icon(Icons.add),
      ),
    );
  }

}