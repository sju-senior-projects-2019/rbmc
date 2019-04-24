import 'package:flutter/material.dart';
import 'mainarray.dart';

class tiles{
  int x;
  int y;
  int tileNumber;
  
  tiles(this.x, this.y, this.tileNumber);

  int getX(){
    return this.x;
  }

  int getY(){
    return this.y;
  }
  
  int getTileNumber(){
    return this.tileNumber;
  }

  Widget temp(BuildContext context) {
    if(images[this.tileNumber].getHidden() == true){
      return Image.asset('asset/Hidden.png');
    }
    else {
      if (player.length == 4) {
        if ((player[0].getX() == this.x && player[0].getY() == this.y) &&
            (player[1].getX() != this.x || player[1].getY() != this.y) && (player[2].getX() != this.x ||
            player[2].getY() != this.y) && (player[3].getX() != this.x || player[3].getY() != this.y)) { //1
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) &&
            (player[1].getX() == this.x && player[1].getY() == this.y) && (player[2].getX() != this.x ||
            player[2].getY() != this.y) && (player[3].getX() != this.x || player[3].getY() != this.y)) { //1 2
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() != this.x || player[3].getY() != this.y)) { //1 3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) &&
            (player[1].getX() != this.x || player[1].getY() != this.y) && (player[2].getX() != this.x ||
            player[2].getY() != this.y) && (player[3].getX() == this.x && player[3].getY() == this.y)) { //1 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)
            && (player[3].getX() != this.x || player[3].getY() != this.y)) { //2
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() != this.x || player[3].getY() != this.y)) { //2 3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { //2 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                right: 40.0,
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() != this.x || player[3].getY() != this.y)) { //3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { //3 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() != this.x || player[3].getY() != this.y)) { //1 2 3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { //1 2 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { // 1 3 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { // 2 3 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { // 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)
            && (player[3].getX() == this.x && player[3].getY() == this.y)) { //1 2 3 4
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                right: 40.0,
                
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(
                      url: images[this.tileNumber].getImageURL());
                }));
              },
              child: Image.asset(images[this.tileNumber].getImageURL())
          );
        }
      }
      else if (player.length == 3){
        if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)) { //1
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)) { //1 2
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)) { //1 3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() != this.x || player[2].getY() != this.y)) { //2
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)) { //2 3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)) { //3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y) && (player[2].getX() == this.x && player[2].getY() == this.y)) { //1 2 3
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                
                left: 40.0,
                
                
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
              Positioned(
                
                
                bottom: 40.0,
                
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(
                      url: images[this.tileNumber].getImageURL());
                }));
              },
              child: Image.asset(images[this.tileNumber].getImageURL())
          );
        }
      }
      else if (player.length == 2){
        if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() != this.x
            || player[1].getY() != this.y)) { //1
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                left: 40.0,
                child: Image.asset('asset/dot.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() == this.x && player[0].getY() == this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y)) { //1 2
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                left: 40.0,
                child: Image.asset('asset/dot.png'),
              ),
              Positioned(
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else if ((player[0].getX() != this.x || player[0].getY() != this.y) && (player[1].getX() == this.x
            && player[1].getY() == this.y)) { //2
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 2);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                top: 40.0,
                child: Image.asset('asset/dot2.png'),
              ),
            ],
          );
        }
        else {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(
                      url: images[this.tileNumber].getImageURL());
                }));
              },
              child: Image.asset(images[this.tileNumber].getImageURL())
          );
        }
      }
      else{
        if (player[0].getX() == this.x && player[0].getY() == this.y) { //1
          return Stack(
            children: <Widget>[
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DetailScreen(
                          url: images[this.tileNumber].getImageURL(),
                          players: 1);
                    }));
                  },
                  child: Image.asset(images[this.tileNumber].getImageURL())
              ),
              Positioned(
                left: 40.0,
                child: Image.asset('asset/dot.png'),
              ),
            ],
          );
        }
        else {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(
                      url: images[this.tileNumber].getImageURL());
                }));
              },
              child: Image.asset(images[this.tileNumber].getImageURL())
          );
        }
      }
    }
  }

}