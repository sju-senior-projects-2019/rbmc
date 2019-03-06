//This class is used by mainarray to create a way to assign letters on the grid
//array to images that make up the actual board.
//X, Y for board position, imageURL is the link to the asset folder, and id is
//the letter associated with a tile, needed for random pink and yellow tiles.
class pictoarray{

  int x;
  int y;
  String imageURL;
  String id;

  pictoarray(this.x, this.y, this.imageURL, this.id);

  String getImageURL(){
    return this.imageURL;
  }

  String getID(){
    return this.id;
  }
}