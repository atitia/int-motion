import processing.video.*;

Movie movie; 

int tileCountX = 12;
int tileCountY = 12;
float tileWidth, tileHeight;
int imageCount = tileCountX * tileCountY;
int currentImage = 0;
int gridX = 0;
int gridY = 0;

void setup(){
  size(1024, 1024);
  smooth();
  background(0);
  
  movie = new Movie(this, "warm-neon.mp4");
  
  tileWidth = width/(float)tileCountX;
  tileHeight = height/(float)tileCountY;
  movie.play();  
}

void draw(){
  float posX = tileWidth*gridX;
  float posY = tileHeight*gridY;
  
  float moviePos = map(currentImage, 0, imageCount, 0, movie.duration() );
  movie.jump(moviePos);
  movie.read();
  image(movie, posX, posY, tileWidth, tileHeight);
  
  gridX++;
  if(gridX>= tileCountX){
    gridX = 0;
    gridY++;
  }
  currentImage++;
  if(currentImage>=imageCount) noLoop();
}

void keyReleased(){
  println("yes");
  if (key=='s' || key =='S') saveFrame("frame_###.png");
}

void movieEvent(Movie m){
  m.read();
}
