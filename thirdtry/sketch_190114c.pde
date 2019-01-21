PImage img;
int tileCountX = 8;
int tileCountY = 8;
int tileCount = tileCountX * tileCountY;
PImage[]imageTiles = new PImage[tileCount];

int tileWidth, tileHeight;

int cropX = 0;
int cropY = 0;

boolean selectMode = true;

void setup(){
 background(255);
 img = loadImage("https://static.boredpanda.com/blog/wp-content/uploads/2016/09/A-Corneta-57e4b893d00ce__700.jpg");
 size(700, 525);
 image(img, 0, 0);
 
 noCursor();
 tileWidth = width/tileCountX;
 tileHeight = height/tileCountY;
}

void draw(){
  if(selectMode==true){
    
    cropX = constrain(mouseX, 0, width-tileWidth);
    cropY = constrain(mouseY, 0, height-tileHeight);
    
    image(img, 0, 0);
    noFill();
    stroke(255);
    rect(cropX, cropY, tileWidth, tileHeight);
  } else {
       //reassemble image that's been sampled
     int i = 0;
       for(int gridY = 0; gridY <tileCountY; gridY++){
         for(int gridX = 0; gridX < tileCountX; gridX++){
           image(imageTiles[i], gridX*tileWidth, gridY*tileHeight);
           i++;
      }
    }
  }
}

void mousePressed(){
 selectMode=false;
 cropTiles();
}

void mouseMoved(){
 selectMode=true; 
}

void cropTiles(){
 int i = 0;
 for(int gridY = 0; gridY <tileCountY; gridY++){
   for(int gridX = 0; gridX < tileCountX; gridX++){
     
     cropX = (int)random(mouseX-tileWidth/2, mouseX+tileWidth/2);
     cropY = (int)random(mouseY-tileHeight/2, mouseY+tileHeight/2);
     
     cropX = constrain(cropX, 0, width-tileWidth);
     cropY = constrain(cropY, 0, height-tileHeight);
     
     imageTiles[i++]=img.get(cropX, cropY, tileWidth, tileHeight);
    }
  }
}
