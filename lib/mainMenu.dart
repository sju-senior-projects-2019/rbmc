import 'package:flutter/material.dart';
import 'package:the_mystic_woodv3/mainarray.dart';

void main(){
  generateBoard();
  randomize();
  createImages();
  generateTiles();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Main Menu',
      home: MyHomePage(title: 'Select Number of Players'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: const Text("1"),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => mainarray(playerNumber: 1,)
                ),
              );
            }
          ),
          RaisedButton(
              child: const Text("2"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => mainarray(playerNumber: 2,)
                  ),
                );
              }
          ),
          RaisedButton(
              child: const Text("3"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => mainarray(playerNumber: 3,)
                  ),
                );
              }
          ),
          RaisedButton(
              child: const Text("4"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => mainarray(playerNumber: 4,)
                  ),
                );
              }
          ),
        ],
      ),
    );
  }
}


