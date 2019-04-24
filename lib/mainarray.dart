import 'package:flutter/material.dart';
import 'package:the_mystic_woodv3/pictoarrary.dart';
import 'package:the_mystic_woodv3/tiles.dart';

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

//Randomizes the board tiles
void randomize(){
  for (int i = 0; i < yellow.length; i++){
    yellow[i] = 'asset/yellow/' + (i+1).toString() + '.png';
    pink[i] = 'asset/pink/' + (i+1).toString() + '.png';
  }
  yellow.shuffle();
  pink.shuffle();
}

List<pictoarray> images = new List(45);
// Assigns images to values based on the grid String array
// locations of each image tile are kept based on x and y coordinates
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

//Creates 5 grids
//The grid without a number holds general tile information
//The grids with numbers hold locations of each player
List<List<String>> grid = new List.generate(9, (i) => new List(5));
List<List<String>> grid1 = new List.generate(9, (i) => new List(5));
List<List<String>> grid2 = new List.generate(9, (i) => new List(5));
List<List<String>> grid3 = new List.generate(9, (i) => new List(5));
List<List<String>> grid4 = new List.generate(9, (i) => new List(5));

//Generates initial board as a String array
//Each player gets their own board
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

//Puts each player in their starting location (Y:0, X:2 or the Earthly Gate)
//Only puts players on the board based on the number of players in the game
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

//Finds player position
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

List<tiles> space = new List(45);
void generateTiles(){
  int i = 0;
  int j = 0;
  int k = 0;
  for(i = 0; i < 9; i++){
    for(j = 0; j < 5; j++){
      space[k] = new tiles(j, i, k);
      k++;
    }
  }
}



//This is ignored if the app is run through the Main Menu
void main(){
  generateBoard();
  randomize();
  createImages();
  generateTiles();
  runApp(mainarray());
}

//The application display starts here
//The app starts here when it is called from another program
//When called from MainMenu, the number of players is pulled from here
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

//The majority of the application's display and functionality is stored in this section
class _MyHomePageState extends State<MyHomePage> {
  // setTile returns the tile the player moved from to the previous letter
  // Certain locations are set while others are just a color based on position
  // on board
  //This function has been updated to restore the String arrays for each of the 4 players
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

  //Used to check if a player is allowed to move onto a tile or not
  bool getRestrictions(String temp, int u, int d){
    if (temp == 'asset/pink/3.png' || temp == 'asset/pink/4.png' || temp == 'asset/pink/5.png' ||
        temp == 'asset/yellow/12.png' || temp == 'asset/yellow/14.png' || temp == 'asset/yellow/15.png'){
      playerLocation();
      if (d == (x1-1)) {
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
      if (u == (y1+1)) {
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
      if (d == (x1+1)) {
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
      if (u == (y1-1)) {
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

  //Checked to see if the player can move up from their current tile
  bool upCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y1 && images[i].getX() == x1){
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

  //Checked to see if the player can move down from their current tile
  bool downCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y1 && images[i].getX() == x1){
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

  //Checked to see if the player can move left from their current tile
  bool leftCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y1 && images[i].getX() == x1){
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

  //Checked to see if the player can move right from their current tile
  bool rightCheck(){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == y1 && images[i].getX() == x1){
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

  //Method to reveal hidden images when player moves
  void checkHidden(int u, int d){
    for (int i = 0; i < images.length; i++){
      if (images[i].getY() == u && images[i].getX() == d){
        images[i].setHidden(false);
      }
    }
  }

  //Method to move the player up
  //Performs multiple checks to see if movement onto new tile is possible
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
          grid1[y1][x1] = "x";
        }
        playerLocation();
        print("[" + (y1).toString() + "], [" + x1.toString() + "]");
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

  //Method to move the player down
  //Performs multiple checks to see if movement onto new tile is possible
  void moveDown(){
    setState(() {
      setTile(1);
      if(!downCheck()) {
        checkHidden(y1-1, x1);
        if (!ruleCheck((y1 - 1), x1)) {
          grid1[y1 - 1][x1] = "x";
        }
        else {
          grid1[y1][x1] = "x";
        }
      }
      else {
        grid1[y1][x1] = "x";
      }
      playerLocation();
      print("[" + (y1).toString() + "], [" + x1.toString() + "]");
    });
  }

  //Method to move the player left
  //Performs multiple checks to see if movement onto new tile is possible
  void moveLeft(){
    setState(() {
      setTile(1);
      if (!leftCheck()) {
        checkHidden(y1, x1+1);
        if (!ruleCheck(y1, (x1 + 1))) {
          grid1[y1][x1 + 1] = "x";
        }
        else {
          grid1[y1][x1] = "x";
        }
      }
      else {
          grid1[y1][x1] = "x";
      }
      playerLocation();
      print("[" + (y1).toString() + "], [" + x1.toString() + "]");
    });
  }

  //Method to move the player right
  //Performs multiple checks to see if movement onto new tile is possible
  void moveRight(){
    setState(() {
      setTile(1);
      if (!rightCheck()) {
        checkHidden(y1, x1-1);
        if (!ruleCheck(y1, (x1 - 1))) {
          grid1[y1][x1 - 1] = "x";
        }
        else {
          grid1[y1][x1] = "x";
        }
      }
      else{
        grid1[y1][x1] = "x";
      }
      playerLocation();
      print("[" + (y1).toString() + "], [" + x1.toString() + "]");
    });
  }

  //Gives the board a way of viewing the layout with letters
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
  
  //App layout starts here
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
        space[44].temp(this.context),
        space[43].temp(this.context),
        space[42].temp(this.context),
        space[41].temp(this.context),
        space[40].temp(this.context),
        space[39].temp(this.context),
        space[38].temp(this.context),
        space[37].temp(this.context),
        space[36].temp(this.context),
        space[35].temp(this.context),
        space[34].temp(this.context),
        space[33].temp(this.context),
        space[32].temp(this.context),
        space[31].temp(this.context),
        space[30].temp(this.context),
        space[29].temp(this.context),
        space[28].temp(this.context),
        space[27].temp(this.context),
        space[26].temp(this.context),
        space[25].temp(this.context),
        space[24].temp(this.context),
        space[23].temp(this.context),
        space[22].temp(this.context),
        space[21].temp(this.context),
        space[20].temp(this.context),
        space[19].temp(this.context),
        space[18].temp(this.context),
        space[17].temp(this.context),
        space[16].temp(this.context),
        space[15].temp(this.context),
        space[14].temp(this.context),
        space[13].temp(this.context),
        space[12].temp(this.context),
        space[11].temp(this.context),
        space[10].temp(this.context),
        space[9].temp(this.context),
        space[8].temp(this.context),
        space[7].temp(this.context),
        space[6].temp(this.context),
        space[5].temp(this.context),
        space[4].temp(this.context),
        space[3].temp(this.context),
        space[2].temp(this.context),
        space[1].temp(this.context),
        space[0].temp(this.context),

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
