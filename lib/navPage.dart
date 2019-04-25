import 'package:flutter/material.dart';
import 'package:the_mystic_woodv3/mainarray.dart';
import 'package:the_mystic_woodv3/diceRoll.dart';
import 'package:the_mystic_woodv3/pages/trialpage.dart';
import 'package:the_mystic_woodv3/pictoarrary.dart';

void main(){
  generateBoard();
  randomize();
  createImages();
  createPlayers();
  generateTiles();
  runApp(new navPage());
}

class navPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: trialpage(),
    );
  }
}

