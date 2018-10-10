// variables
int numRows = 10;
int numColumns = 10;
int tileSize;


// processing setup
void setup() {
  // initial setup
  background(0);  // set the background to black
  size(400, 400); // set the dimension of the canvas

  drawGrid();     // call the method once to draw the grid 
}

void draw() {
  // nothing is needed here
}


// processing event handlers
void mousePressed() {
  // obtain the ratio of the mouse position versus the x and y axies 
  // the float() method is called to cast (force)
  // the integer variables into floating point numbers
  // so that the division work
  float ratioX = float(mouseX) / float(width);
  float ratioY = float(mouseY) / float(height);
  
  // calculate the position of the tile to color
  // by getting at which tile index the mouse is located
  // and then multiply the index by the tile size
  // to get the coordinates to draw a colored tiled 
  int tileX = floor(ratioX * numColumns) * tileSize;
  int tileY = floor(ratioY * numRows) * tileSize;
  
  // set random rgb values to the fill
  fill(
    floor(random(255)), // get random red
    floor(random(255)), // get random green
    floor(random(255))  // get random blue
  );

  // draw the rectangle
  rect(
    tileX, tileY,       // coordinates
    tileSize, tileSize  // dimensions
  );
  
  // release the fill, so next method calling fill
  // is not stuck with last color set 
  noFill();
}


// custom methods definitions
void drawGrid() {
  // get tile size
  tileSize = width / numColumns;
  
  // init tile positions
  int tileX = 0;
  int tileY = 0;

  // iterate through the columns
  for (int i = 0; i < numColumns; i++) {
    // draw each column 
    for (int j = 0; j < numRows; j++) {
      // calculate the position of the tile
      tileX = i * tileSize;
      tileY = j * tileSize;
      // draw the tile
      rect(tileX, tileY, tileSize, tileSize);
    }
  }
}