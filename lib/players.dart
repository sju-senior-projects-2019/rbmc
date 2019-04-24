class players{

  int x;
  int y;
  int playerNumber;

  players(this.x, this.y, this.playerNumber);

  int getX(){
    return this.x;
  }

  int getY(){
    return this.y;
  }

  int getPlayerNumber(){
    return this.playerNumber;
  }

  void setX(int newX){
    this.x = newX;
  }

  void setY(int newY){
    this.y = newY;
  }

}