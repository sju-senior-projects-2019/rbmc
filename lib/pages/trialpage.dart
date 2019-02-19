import 'package:flutter/material.dart';
import 'dart:async';

class trialpage extends StatefulWidget{
  @override
  State createState()=> trialpageState();

}

class trialpageState extends State<trialpage>{
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()=>print("Timeout"));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        fit : StackFit.expand,

        children: <Widget>[
          Container(
            decoration: BoxDecoration(image: DecorationImage(
                image: AssetImage('asset/img/0X.jpg'), fit: BoxFit.fill),
            ),
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      Padding(padding: EdgeInsets.only(top:20.0),),

                    ],
                  ),
                ),
              ),

              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(backgroundColor: Colors.red,),
                      Padding(padding: EdgeInsets.only(top: 20.0),),
                      Text("Embarking on Journey", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),),
                    ],
                  )
              )

            ],
          )
        ],
      ),
    );

  }
}