PImage img;

void setup(){
 background(255);
 img = loadImage("https://static.boredpanda.com/blog/wp-content/uploads/2016/09/A-Corneta-57e4b893d00ce__700.jpg");
 size(700, 525);
 image(img, 0, 0);
}

void draw(){
  int x1 = (int)random(0, width);
  int y1 = (int)random(0, height);
  
  int x2 = round(x1 + random(-5, 5));
  int y2 = round(y1 + random(-5, 5));
  
  int w = 525;
  int h = 5;
  
  copy(x1, y1, w, h, x2, y2, w, h);
}

void keyPressed(){
 if(keyCode == DELETE || keyCode == BACKSPACE){
 image(img, 0, 0);
}

  if(keyCode == UP){
   noLoop(); 
  }
  
  if(keyCode == DOWN){
   loop(); 
  }
}
