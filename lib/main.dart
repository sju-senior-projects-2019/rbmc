import 'package:flutter/material.dart';
import 'pages/trialpage.dart';
import 'package:the_mystic_woodv3/gameboard.dart';
import 'package:the_mystic_woodv3/gametiles.dart';
import 'dart:async';


void main(){
  runApp(new MaterialApp(
    theme: ThemeData(primaryColor: Colors.redAccent, accentColor: Colors.black),
    debugShowCheckedModeBanner: false,
    home: trialpage(),
  ));

}