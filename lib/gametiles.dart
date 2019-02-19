import 'package:flutter/material.dart';

class GameTiles extends StatefulWidget {
  final GameTile tile;

  GameTiles({Key key, this.tile})
      : super(key: key);


  @override
  State<StatefulWidget> createState(){
    return GameTileState();
  }


}

class GameTileState extends State<GameTiles> with TickerProviderStateMixin{
  AnimationController controller;
  Animation<double> frontScale;
  Animation<double> backScale;
  String priImage, secImage;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }


}

class GameTile {
  String image;
  int id;
  bool closedEff;
  Key key;

  GameTile({this.key, this.image, this.id, this.closedEff = false});

}
