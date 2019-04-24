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
      if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] != "x" && grid4[this.y][this.x] != "x") {//1
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] != "x" && grid4[this.y][this.x] != "x") {//1 2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] != "x") {//1 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] != "x" && grid4[this.y][this.x] == "x") {//1 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] != "x" && grid4[this.y][this.x] != "x") {//2
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] != "x") {//2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] != "x" && grid4[this.y][this.x] == "x") {//2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] != "x") {//3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] != "x") {//1 2 3
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] != "x" && grid4[this.y][this.x] == "x") {//1 2 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 1);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] == "x") {// 1 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] == "x") {// 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] != "x" && grid2[this.y][this.x] != "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] == "x") {//3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
      else if (grid1[this.y][this.x] == "x" && grid2[this.y][this.x] == "x" && grid3[this.y][this.x] == "x" && grid4[this.y][this.x] == "x") {//1 2 3 4
        return Stack(
          children: <Widget>[
            GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                        url: images[this.tileNumber].getImageURL(), players: 2);
                  }));
                },
                child: Image.asset(images[this.tileNumber].getImageURL())
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
                return DetailScreen(url: images[this.tileNumber].getImageURL());
              }));
            },
            child: Image.asset(images[this.tileNumber].getImageURL())
        );
      }
    }
  }

}