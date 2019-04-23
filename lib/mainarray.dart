import 'package:flutter/material.dart';
import 'package:the_mystic_woodv3/pictoarrary.dart';

int x = 0;
int y = 0;

int x1 = 0;
int y1 = 0;

int x2 = 0;
int y2 = 0;

int x3 = 0;
int y3 = 0;

int x4 = 0;
int y4 = 0;

int pnum = 1;
int pnumMax = 0;

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
        images[k] = new pictoarray(j, i, yellow[y], grid[i][j], true);
        k++;
        y++;
      }
      else if (grid[i][j] == "p"){
        images[k] = new pictoarray(j, i, pink[p], grid[i][j], true);
        k++;
        p++;
      }
      else if (grid[i][j] == "A"){
        images[k] = new pictoarray(j, i, 'asset/yellow/Gate.png', grid[i][j], false);
        k++;
      }
      else if (grid[i][j] == "N"){
        images[k] = new pictoarray(j, i, 'asset/pink/Gate.png', grid[i][j], false);
        k++;
      }
      else if (grid[i][j] == "T"){
        images[k] = new pictoarray(j, i, 'asset/Tower.png', grid[i][j], false);
        k++;
      }
      else{
        images[k] = new pictoarray(j, i, 'asset/06.jpg', grid[i][j], true);
        k++;
      }
    }
  }
}

//Generates initial board
List<List<String>> grid = new List.generate(9, (i) => new List(5));
List<List<String>> grid1 = new List.generate(9, (i) => new List(5));
List<List<String>> grid2 = new List.generate(9, (i) => new List(5));
List<List<String>> grid3 = new List.generate(9, (i) => new List(5));
List<List<String>> grid4 = new List.generate(9, (i) => new List(5));
void generateBoard(){
  for (int i = 0; i < grid.length; i++) {
    for (int j = 0; j < grid[0].length; j++) {
      if(i == 4 && j == 2){ // Tower location
        grid[i][j] = "T";
        grid1[i][j] = "T";
        grid2[i][j] = "T";
        grid3[i][j] = "T";
        grid4[i][j] = "T";
      }
      else if(i == 0 && j == 2){ // Earthly Gate Location
        grid[i][j] = "A";
        grid1[i][j] = "A";
        grid2[i][j] = "A";
        grid3[i][j] = "A";
        grid4[i][j] = "A";
      }
      else if(i == 8 && j == 2){ // Enchanted Gate Location
        grid[i][j] = "N";
        grid1[i][j] = "N";
        grid2[i][j] = "N";
        grid3[i][j] = "N";
        grid4[i][j] = "N";
      }
      else if(i < 4){ // Sets bottom of board to yellow(Earthly) tiles
        grid[i][j] = "y";
        grid1[i][j] = "y";
        grid2[i][j] = "y";
        grid3[i][j] = "y";
        grid4[i][j] = "y";
      }
      else if(i > 4){ // Sets top of board to pink(Enchanted) tiles
        grid[i][j] = "p";
        grid1[i][j] = "p";
        grid2[i][j] = "p";
        grid3[i][j] = "p";
        grid4[i][j] = "p";
      }
      else if(i == 4 && j > 2){ // Makes tiles to left of tower pink(Enchanted)
        grid[i][j] = "p";
        grid1[i][j] = "p";
        grid2[i][j] = "p";
        grid3[i][j] = "p";
        grid4[i][j] = "p";
      }
      else if(i == 4 && j < 2){ // Makes tiles to right of tower yellow(Earthly)
        grid[i][j] = "y";
        grid1[i][j] = "y";
        grid2[i][j] = "y";
        grid3[i][j] = "y";
        grid4[i][j] = "y";
      }
      else{ // Makes a dash if mistake occurs
        grid[i][j] = "-";
        grid1[i][j] = "-";
        grid2[i][j] = "-";
        grid3[i][j] = "-";
        grid4[i][j] = "-";
      }
    }
  }
}

void playerSpawn(int numPlayers){
  if(numPlayers == 1) {
    grid1[0][2] = "x";
    x1 = 2;
    y1 = 0;
  }
  else if(numPlayers == 2){
    grid1[0][2] = "x";
    x1 = 2;
    y1 = 0;

    grid2[0][2] = "x";
    x2 = 2;
    y2 = 0;
  }
  else if(numPlayers == 3){
    grid1[0][2] = "x";
    x1 = 2;
    y1 = 0;

    grid2[0][2] = "x";
    x2 = 2;
    y2 = 0;

    grid3[0][2] = "x";
    x3 = 2;
    y3 = 0;
  }
  else if(numPlayers == 4){
    grid1[0][2] = "x";
    x1 = 2;
    y1 = 0;

    grid2[0][2] = "x";
    x2 = 2;
    y2 = 0;

    grid3[0][2] = "x";
    x3 = 2;
    y3 = 0;

    grid4[0][2] = "x";
    x4 = 2;
    y4 = 0;
  }
  else{

  }
  pnumMax = numPlayers;
}

//To be implemented to find play position potentially replacing x and y variables
void playerLocation(){
  for (int i = 0; i < grid1.length; i++) {
    for (int j = 0; j < grid1[0].length; j++) {
      if(grid1[i][j] == "x"){
        x1 = j;
        y1 = i;
      }
      if(grid2[i][j] == "x"){
        x2 = j;
        y2 = i;
      }
      if(grid3[i][j] == "x"){
        x3 = j;
        y3 = i;
      }
      if(grid4[i][j] == "x"){
        x4 = j;
        y4 = i;
      }
    }
  }
}

void main(){
  generateBoard();
  randomize();
  createImages();
  runApp(mainarray());
}

class mainarray extends StatelessWidget {
  final int playerNumber;

  mainarray({Key key, @required this.playerNumber})
      : assert(playerNumber != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    playerSpawn(this.playerNumber);
    return MaterialApp(
      title: 'The Mystic Wood',
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
  void setTile(int player){
    if(player == 1) {
      if (y1 == 4 && x1 == 2) { // Tower location
        grid1[y1][x1] = "T";
      }
      else if (y1 == 0 && x1 == 2) { // Earthly Gate Location
        grid1[y1][x1] = "A";
      }
      else if (y1 == 8 && x1 == 2) { // Enchanted Gate Location
        grid1[y1][x1] = "N";
      }
      else if (y1 < 4) { // Sets bottom of board to yellow(Earthly) tiles
        grid1[y1][x1] = "y";
      }
      else if (y1 > 4) { // Sets top of board to pink(Enchanted) tiles
        grid1[y1][x1] = "p";
      }
      else if (y1 == 4 && x1 > 2) { // Makes tiles to left of tower pink(Enchanted)
        grid1[y1][x1] = "p";
      }
      else if (y1 == 4 && x1 < 2) { // Makes tiles to right of tower yellow(Earthly)
        grid1[y1][x1] = "y";
      }
      else { // Makes a dash if mistake occurs
        grid1[y1][x1] = "-";
      }
    }
    else if(player == 2){
      if (y2 == 4 && x2 == 2) { // Tower location
        grid2[y2][x2] = "T";
      }
      else if (y2 == 0 && x2 == 2) { // Earthly Gate Location
        grid2[y2][x2] = "A";
      }
      else if (y2 == 8 && x2 == 2) { // Enchanted Gate Location
        grid2[y2][x2] = "N";
      }
      else if (y2 < 4) { // Sets bottom of board to yellow(Earthly) tiles
        grid2[y2][x2] = "y";
      }
      else if (y2 > 4) { // Sets top of board to pink(Enchanted) tiles
        grid2[y2][x2] = "p";
      }
      else if (y2 == 4 && x2 > 2) { // Makes tiles to left of tower pink(Enchanted)
        grid2[y2][x2] = "p";
      }
      else if (y2 == 4 && x2 < 2) { // Makes tiles to right of tower yellow(Earthly)
        grid2[y2][x2] = "y";
      }
      else { // Makes a dash if mistake occurs
        grid2[y2][x2] = "-";
      }
    }
    else if(player == 3){
      if (y3 == 4 && x3 == 2) { // Tower location
        grid3[y3][x3] = "T";
      }
      else if (y3 == 0 && x3 == 2) { // Earthly Gate Location
        grid3[y3][x3] = "A";
      }
      else if (y3 == 8 && x3 == 2) { // Enchanted Gate Location
        grid3[y3][x3] = "N";
      }
      else if (y3 < 4) { // Sets bottom of board to yellow(Earthly) tiles
        grid3[y3][x3] = "y";
      }
      else if (y3 > 4) { // Sets top of board to pink(Enchanted) tiles
        grid3[y3][x3] = "p";
      }
      else if (y3 == 4 && x3 > 2) { // Makes tiles to left of tower pink(Enchanted)
        grid3[y3][x3] = "p";
      }
      else if (y3 == 4 && x3 < 2) { // Makes tiles to right of tower yellow(Earthly)
        grid3[y3][x3] = "y";
      }
      else { // Makes a dash if mistake occurs
        grid3[y3][x3] = "-";
      }
    }
    else if(player == 4){
      if (y4 == 4 && x4 == 2) { // Tower location
        grid4[y4][x4] = "T";
      }
      else if (y4 == 0 && x4 == 2) { // Earthly Gate Location
        grid4[y4][x4] = "A";
      }
      else if (y4 == 8 && x4 == 2) { // Enchanted Gate Location
        grid4[y4][x4] = "N";
      }
      else if (y4 < 4) { // Sets bottom of board to yellow(Earthly) tiles
        grid4[y4][x4] = "y";
      }
      else if (y4 > 4) { // Sets top of board to pink(Enchanted) tiles
        grid4[y4][x4] = "p";
      }
      else if (y4 == 4 && x4 > 2) { // Makes tiles to left of tower pink(Enchanted)
        grid4[y4][x4] = "p";
      }
      else if (y4 == 4 && x4 < 2) { // Makes tiles to right of tower yellow(Earthly)
        grid4[y4][x4] = "y";
      }
      else { // Makes a dash if mistake occurs
        grid4[y4][x4] = "-";
      }
    }
    else{

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
  bool ruleCheck(int u, int d){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == u && images[i].getX() == d){
        print("true");
        return getRestrictions(images[i].getImageURL(), u, d);

      }
    }
    return false;
  }

  bool getRestrictions(String temp, int u, int d){
    if (temp == 'asset/pink/3.png' || temp == 'asset/pink/4.png' || temp == 'asset/pink/5.png' ||
        temp == 'asset/yellow/12.png' || temp == 'asset/yellow/14.png' || temp == 'asset/yellow/15.png'){
      playerLocation();
      if (d == (x-1)) {
        print("true");
        return true;
      }
      else{
        return false;
      }
    }
    else if (temp == 'asset/pink/6.png' || temp == 'asset/pink/9.png' || temp == 'asset/pink/15.png' ||
        temp == 'asset/yellow/11.png' || temp == 'asset/yellow/18.png' || temp == 'asset/yellow/20.png'){
      playerLocation();
      if (u == (y+1)) {
        print("true");
        return true;
      }
      else{
        return false;
      }
    }
    else if (temp == 'asset/pink/7.png' || temp == 'asset/pink/12.png' || temp == 'asset/pink/16.png' ||
        temp == 'asset/yellow/9.png' || temp == 'asset/yellow/13.png' || temp == 'asset/yellow/19.png'){
      playerLocation();
      if (d == (x+1)) {
        print("true");
        return true;
      }
      else{
        return false;
      }
    }
    else if (temp == 'asset/pink/8.png' || temp == 'asset/pink/17.png' || temp == 'asset/pink/18.png' ||
        temp == 'asset/yellow/4.png' || temp == 'asset/yellow/10.png' || temp == 'asset/yellow/16.png'){
      playerLocation();
      if (u == (y-1)) {
        print("true");
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false;
    }
  }

  bool upCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y && images[i].getX() == x){
        print("true");
        if (images[i].getImageURL() == 'asset/yellow/4.png' || images[i].getImageURL() == 'asset/yellow/10.png' ||
            images[i].getImageURL() == 'asset/yellow/16.png' || images[i].getImageURL() == 'asset/pink/8.png' ||
            images[i].getImageURL() == 'asset/pink/17.png' || images[i].getImageURL() == 'asset/pink/18.png'){
          print("true");
          return true;
        }
        else{
          return false;
        }
      }
    }
    return false;
  }

  bool downCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y && images[i].getX() == x){
        print("true");
        if (images[i].getImageURL() == 'asset/yellow/11.png' || images[i].getImageURL() == 'asset/yellow/18.png' ||
            images[i].getImageURL() == 'asset/yellow/20.png' || images[i].getImageURL() == 'asset/pink/6.png' ||
            images[i].getImageURL() == 'asset/pink/9.png' || images[i].getImageURL() == 'asset/pink/15.png'){
          print("true");
          return true;
        }
        else{
          return false;
        }
      }
    }
    return false;
  }

  bool leftCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y && images[i].getX() == x){
        print("true");
        if (images[i].getImageURL() == 'asset/yellow/12.png' || images[i].getImageURL() == 'asset/yellow/14.png' ||
            images[i].getImageURL() == 'asset/yellow/15.png' || images[i].getImageURL() == 'asset/pink/3.png' ||
            images[i].getImageURL() == 'asset/pink/4.png' || images[i].getImageURL() == 'asset/pink/5.png'){
          print("true");
          return true;
        }
        else{
          return false;
        }
      }
    }
    return false;
  }

  bool rightCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y && images[i].getX() == x){
        print("true");
        if (images[i].getImageURL() == 'asset/yellow/9.png' || images[i].getImageURL() == 'asset/yellow/13.png' ||
            images[i].getImageURL() == 'asset/yellow/19.png' || images[i].getImageURL() == 'asset/pink/7.png' ||
            images[i].getImageURL() == 'asset/pink/12.png' || images[i].getImageURL() == 'asset/pink/16.png'){
          print("true");
          return true;
        }
        else{
          return false;
        }
      }
    }
    return false;
  }

  void checkHidden(int u, int d){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == u && images[i].getX() == d){
        images[i].setHidden(false);
      }
    }
  }

  void moveUp(){
    setState(() {
      setTile(pnum);
      if(pnum == 1) {
        if (!upCheck()) {
          checkHidden(y1 + 1, x1);
          if (!ruleCheck((y1 + 1), x1)) {
            grid1[y1 + 1][x1] = "x";
          }
          else {
            grid1[y1][x1] = "x";
          }
        }
        else {
          grid1[y][x] = "x";
        }
        playerLocation();
        print("[" + (y).toString() + "], [" + x.toString() + "]");
      }
      else if(pnum == 2) {
        if (!upCheck()) {
          checkHidden(y + 1, x);
          if (!ruleCheck((y + 1), x)) {
            grid1[y + 1][x] = "x";
          }
          else {
            grid1[y][x] = "x";
          }
        }
        else {
          grid1[y][x] = "x";
        }
        playerLocation();
        print("[" + (y).toString() + "], [" + x.toString() + "]");
      }
    });
  }

  void moveDown(){
    setState(() {
      setTile(1);
      if(!downCheck()) {
        checkHidden(y-1, x);
        if (!ruleCheck((y - 1), x)) {
          grid1[y - 1][x] = "x";
        }
        else {
          grid1[y][x] = "x";
        }
      }
      else {
        grid1[y][x] = "x";
      }
      playerLocation();
      print("[" + (y).toString() + "], [" + x.toString() + "]");
    });
  }

  void moveLeft(){
    setState(() {
      setTile(1);
      if (!leftCheck()) {
        checkHidden(y, x+1);
        if (!ruleCheck(y, (x + 1))) {
          grid1[y][x + 1] = "x";
        }
        else {
          grid1[y][x] = "x";
        }
      }
      else {
          grid1[y][x] = "x";
      }
      playerLocation();
      print("[" + (y).toString() + "], [" + x.toString() + "]");
    });
  }

  void moveRight(){
    setState(() {
      setTile(1);
      if (!rightCheck()) {
        checkHidden(y, x-1);
        if (!ruleCheck(y, (x - 1))) {
          grid1[y][x - 1] = "x";
        }
        else {
          grid1[y][x] = "x";
        }
      }
      else{
        grid1[y][x] = "x";
      }
      playerLocation();
      print("[" + (y).toString() + "], [" + x.toString() + "]");
    });
  }

  //Gives the board a (temporary) way of viewing the layout
  String board2String(){
    String board = "";
    for (int i = 8; i >= 0; i--) {
      for (int j = 4; j >= 0; j--) {
        board += grid1[i][j] + "  ";
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
              buttons(),
            ],
        ),
      ),
    );
  }
  Widget tile84() {
    if(images[44].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[8][4] == "x" && grid2[8][4] != "x" && grid3[8][4] != "x" && grid4[8][4] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] == "x" && grid3[8][4] != "x" && grid4[8][4] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] != "x" && grid3[8][4] == "x" && grid4[8][4] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] != "x" && grid3[8][4] != "x" && grid4[8][4] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] == "x" && grid3[8][4] != "x" && grid4[8][4] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] == "x" && grid3[8][4] == "x" && grid4[8][4] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] == "x" && grid3[8][4] != "x" && grid4[8][4] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] != "x" && grid3[8][4] == "x" && grid4[8][4] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] != "x" && grid3[8][4] == "x" && grid4[8][4] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] == "x" && grid3[8][4] == "x" && grid4[8][4] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] == "x" && grid3[8][4] != "x" && grid4[8][4] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] != "x" && grid3[8][4] == "x" && grid4[8][4] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] == "x" && grid3[8][4] == "x" && grid4[8][4] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] != "x" && grid2[8][4] != "x" && grid3[8][4] == "x" && grid4[8][4] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][4] == "x" && grid2[8][4] == "x" && grid3[8][4] == "x" && grid4[8][4] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[44].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[44].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[44].getImageURL());
              }));
            },
            child: Image.asset(images[44].getImageURL())
        );
      }
    }
  }

  Widget tile83() {
    if(images[43].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[8][3] == "x" && grid2[8][3] != "x" && grid3[8][3] != "x" && grid4[8][3] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] == "x" && grid3[8][3] != "x" && grid4[8][3] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] != "x" && grid3[8][3] == "x" && grid4[8][3] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] != "x" && grid3[8][3] != "x" && grid4[8][3] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] == "x" && grid3[8][3] != "x" && grid4[8][3] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] == "x" && grid3[8][3] == "x" && grid4[8][3] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] == "x" && grid3[8][3] != "x" && grid4[8][3] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] != "x" && grid3[8][3] == "x" && grid4[8][3] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] != "x" && grid3[8][3] == "x" && grid4[8][3] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] == "x" && grid3[8][3] == "x" && grid4[8][3] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] == "x" && grid3[8][3] != "x" && grid4[8][3] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] != "x" && grid3[8][3] == "x" && grid4[8][3] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] == "x" && grid3[8][3] == "x" && grid4[8][3] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] != "x" && grid2[8][3] != "x" && grid3[8][3] == "x" && grid4[8][3] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][3] == "x" && grid2[8][3] == "x" && grid3[8][3] == "x" && grid4[8][3] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[43].getImageURL());
              }));
            },
            child: Image.asset(images[43].getImageURL())
        );
      }
    }
  }

  Widget tile82() {
    if(images[42].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[8][2] == "x" && grid2[8][2] != "x" && grid3[8][2] != "x" && grid4[8][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] == "x" && grid3[8][2] != "x" && grid4[8][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] != "x" && grid3[8][2] == "x" && grid4[8][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] != "x" && grid3[8][2] != "x" && grid4[8][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] == "x" && grid3[8][2] != "x" && grid4[8][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] == "x" && grid3[8][2] == "x" && grid4[8][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] == "x" && grid3[8][2] != "x" && grid4[8][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] != "x" && grid3[8][2] == "x" && grid4[8][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] != "x" && grid3[8][2] == "x" && grid4[8][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] == "x" && grid3[8][2] == "x" && grid4[8][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] == "x" && grid3[8][2] != "x" && grid4[8][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] != "x" && grid3[8][2] == "x" && grid4[8][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] == "x" && grid3[8][2] == "x" && grid4[8][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] != "x" && grid2[8][2] != "x" && grid3[8][2] == "x" && grid4[8][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][2] == "x" && grid2[8][2] == "x" && grid3[8][2] == "x" && grid4[8][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[42].getImageURL());
              }));
            },
            child: Image.asset(images[42].getImageURL())
        );
      }
    }
  }

  Widget tile81() {
    if(images[41].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[8][1] == "x" && grid2[8][1] != "x" && grid3[8][1] != "x" && grid4[8][1] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[8][1] == "x" && grid2[8][1] == "x" && grid3[8][1] != "x" && grid4[8][1] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[41].getImageURL());
              }));
            },
            child: Image.asset(images[41].getImageURL())
        );
      }
    }
  }

  Widget tile80() {
    if(images[40].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[40].getImageURL());
              }));
            },
            child: Image.asset(images[40].getImageURL())
        );
      }
    }
  }

  Widget tile74() {
    if(images[39].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[39].getImageURL());
              }));
            },
            child: Image.asset(images[39].getImageURL())
        );
      }
    }
  }

  Widget tile73() {
    if(images[38].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[38].getImageURL());
              }));
            },
            child: Image.asset(images[38].getImageURL())
        );
      }
    }
  }

  Widget tile72() {
    if(images[37].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[37].getImageURL());
              }));
            },
            child: Image.asset(images[37].getImageURL())
        );
      }
    }
  }

  Widget tile71() {
    if(images[36].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[36].getImageURL());
              }));
            },
            child: Image.asset(images[36].getImageURL())
        );
      }
    }
  }

  Widget tile70() {
    if(images[35].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[35].getImageURL());
              }));
            },
            child: Image.asset(images[35].getImageURL())
        );
      }
    }
  }

  Widget tile64() {
    if(images[34].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[34].getImageURL());
              }));
            },
            child: Image.asset(images[34].getImageURL())
        );
      }
    }
  }

  Widget tile63() {
    if(images[33].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[33].getImageURL());
              }));
            },
            child: Image.asset(images[33].getImageURL())
        );
      }
    }
  }

  Widget tile62() {
    if(images[32].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[32].getImageURL());
              }));
            },
            child: Image.asset(images[32].getImageURL())
        );
      }
    }
  }

  Widget tile61() {
    if(images[31].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[31].getImageURL());
              }));
            },
            child: Image.asset(images[31].getImageURL())
        );
      }
    }
  }

  Widget tile60() {
    if(images[30].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[30].getImageURL());
              }));
            },
            child: Image.asset(images[30].getImageURL())
        );
      }
    }
  }

  Widget tile54() {
    if(images[29].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[29].getImageURL());
              }));
            },
            child: Image.asset(images[29].getImageURL())
        );
      }
    }
  }

  Widget tile53() {
    if(images[28].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[28].getImageURL());
              }));
            },
            child: Image.asset(images[28].getImageURL())
        );
      }
    }
  }

  Widget tile52() {
    if(images[27].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[27].getImageURL());
              }));
            },
            child: Image.asset(images[27].getImageURL())
        );
      }
    }
  }

  Widget tile51() {
    if(images[26].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[26].getImageURL());
              }));
            },
            child: Image.asset(images[26].getImageURL())
        );
      }
    }
  }

  Widget tile50() {
    if(images[25].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[25].getImageURL());
              }));
            },
            child: Image.asset(images[25].getImageURL())
        );
      }
    }
  }

  Widget tile44() {
    if(images[24].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[24].getImageURL());
              }));
            },
            child: Image.asset(images[24].getImageURL())
        );
      }
    }
  }

  Widget tile43() {
    if(images[23].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[23].getImageURL());
              }));
            },
            child: Image.asset(images[23].getImageURL())
        );
      }
    }
  }

  Widget tile42() {
    if(images[22].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[22].getImageURL());
              }));
            },
            child: Image.asset(images[22].getImageURL())
        );
      }
    }
  }

  Widget tile41() {
    if(images[21].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[21].getImageURL());
              }));
            },
            child: Image.asset(images[21].getImageURL())
        );
      }
    }
  }

  Widget tile40() {
    if(images[20].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[20].getImageURL());
              }));
            },
            child: Image.asset(images[20].getImageURL())
        );
      }
    }
  }

  Widget tile34() {
    if(images[19].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[19].getImageURL());
              }));
            },
            child: Image.asset(images[19].getImageURL())
        );
      }
    }
  }

  Widget tile33() {
    if(images[18].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[18].getImageURL());
              }));
            },
            child: Image.asset(images[18].getImageURL())
        );
      }
    }
  }

  Widget tile32() {
    if(images[17].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[17].getImageURL());
              }));
            },
            child: Image.asset(images[17].getImageURL())
        );
      }
    }
  }

  Widget tile31() {
    if(images[16].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[16].getImageURL());
              }));
            },
            child: Image.asset(images[16].getImageURL())
        );
      }
    }
  }

  Widget tile30() {
    if(images[15].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[15].getImageURL());
              }));
            },
            child: Image.asset(images[15].getImageURL())
        );
      }
    }
  }

  Widget tile24() {
    if(images[14].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[14].getImageURL());
              }));
            },
            child: Image.asset(images[14].getImageURL())
        );
      }
    }
  }

  Widget tile23() {
    if(images[13].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[13].getImageURL());
              }));
            },
            child: Image.asset(images[13].getImageURL())
        );
      }
    }
  }

  Widget tile22() {
    if(images[12].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[12].getImageURL());
              }));
            },
            child: Image.asset(images[12].getImageURL())
        );
      }
    }
  }

  Widget tile21() {
    if(images[11].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[11].getImageURL());
              }));
            },
            child: Image.asset(images[11].getImageURL())
        );
      }
    }
  }

  Widget tile20() {
    if(images[10].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[10].getImageURL());
              }));
            },
            child: Image.asset(images[10].getImageURL())
        );
      }
    }
  }

  Widget tile14() {
    if(images[9].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[9].getImageURL());
              }));
            },
            child: Image.asset(images[9].getImageURL())
        );
      }
    }
  }

  Widget tile13() {
    if(images[8].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[8].getImageURL());
              }));
            },
            child: Image.asset(images[8].getImageURL())
        );
      }
    }
  }

  Widget tile12() {
    if(images[7].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[7].getImageURL());
              }));
            },
            child: Image.asset(images[7].getImageURL())
        );
      }
    }
  }

  Widget tile11() {
    if(images[6].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[6].getImageURL());
              }));
            },
            child: Image.asset(images[6].getImageURL())
        );
      }
    }
  }

  Widget tile10() {
    if(images[5].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[5].getImageURL());
              }));
            },
            child: Image.asset(images[5].getImageURL())
        );
      }
    }
  }

  Widget tile04() {
    if(images[4].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[4].getImageURL());
              }));
            },
            child: Image.asset(images[4].getImageURL())
        );
      }
    }
  }

  Widget tile03() {
    if(images[3].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[3].getImageURL());
              }));
            },
            child: Image.asset(images[3].getImageURL())
        );
      }
    }
  }
  //Only Widget updated to support 4 players
  Widget tile02() {
    if(images[2].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[2].getImageURL());
              }));
            },
            child: Image.asset(images[2].getImageURL())
        );
      }
    }
  }

  Widget tile01() {
    if(images[1].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[1].getImageURL());
              }));
            },
            child: Image.asset(images[1].getImageURL())
        );
      }
    }
  }

  Widget tile00() {
    if(images[0].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] != "x" && grid4[0][2] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] != "x" && grid2[0][2] != "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else if (grid1[0][2] == "x" && grid2[0][2] == "x" && grid3[0][2] == "x" && grid4[0][2] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[2].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[2].getImageURL())
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 10.0,
              top: 40.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 10.0,
              bottom: 40.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 40.0,
              left: 10.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/dot2.png'),
            ),
          ],
        );
      }
      else {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DetailScreen(url: images[0].getImageURL());
              }));
            },
            child: Image.asset(images[0].getImageURL())
        );
      }
    }
  }


  /*Widget test2(){
    for (int z = 0; z < images.length; z++){
      Image.asset(images[z].getImageURL());
    }
  }*/

  Widget buildBoard() {
    return Expanded(child: GridView.count(
      primary: false,
      crossAxisCount: 5,
      childAspectRatio: 900.0 / 586.0,
      children: <Widget>[
        tile84(),
        tile83(),
        tile82(),
        tile81(),
        tile80(),
        tile74(),
        tile73(),
        tile72(),
        tile71(),
        tile70(),
        tile64(),
        tile63(),
        tile62(),
        tile61(),
        tile60(),
        tile54(),
        tile53(),
        tile52(),
        tile51(),
        tile50(),
        tile44(),
        tile43(),
        tile42(),
        tile41(),
        tile40(),
        tile34(),
        tile33(),
        tile32(),
        tile31(),
        tile30(),
        tile24(),
        tile23(),
        tile22(),
        tile21(),
        tile20(),
        tile14(),
        tile13(),
        tile12(),
        tile11(),
        tile10(),
        tile04(),
        tile03(),
        tile02(),
        tile01(),
        tile00(),
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
  final int players;

  DetailScreen({Key key, @required this.url, this.players})
      : assert(url != null),
        super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {
    if(widget.players == 1){
      return Scaffold(
        body: Stack(
          children: <Widget>[
            GestureDetector(
              child: Center(
                child: Image.asset(widget.url),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Positioned(
              right: 10.0,
              left: 40.0,
              bottom: 10.0,
              top: 10.0,
              child: Image.asset('asset/player1example.jpg'),
            ),
          ],
        ),
      );
    }
    else {
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
}
