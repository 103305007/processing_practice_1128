//Declare fish size 
final float S = 80;
final float M = 130;
final float L = 200;

float x, y, xSpeed, ySpeed, size;
PImage fishImg;

//Declare button size, text position & contents 
float btnW = 200;
float btnH = 40;
float txtInitX = 100;
float txtY = 25;
String[] txt = {"Random-sized", "Small-sized", "Medium-sized", "Large-sized"}; 

int fishCounter;


void setup() {
  size(800, 600);
  textFont(createFont("AppleGothic", 15));
  textAlign(CENTER);
}


void draw() {
  background(0, 255, 255);
  
  // draw buttons
  fill(240);
  stroke(100);
  strokeWeight(1); 
  for(int i=0; i<4; i++){rect(btnW*i, 0, btnW, btnH);}
  fill(0);      
  for(int i=0; i<4; i++){text(txt[i], i*btnW+txtInitX, txtY);}
  text("Fish Account : " + fishCounter, txtInitX, height-txtY);

   // move and display a fish
   if (fishImg != null){
     moveAndDisplay();
   }
}


void setupFish() {
    int fishSpecies = (floor(random(4))+1);
    fishImg = loadImage("img/" + fishSpecies + ".png");
    size = (random(1)+1)*100;
    x = random(width-size);
    y = btnH;
    xSpeed = random(6)-3;
    ySpeed = random(6)-3;
    println("create a fish");
}


void moveAndDisplay() {
    x += xSpeed;
    y += ySpeed;
    if(x<0 || x>width-size) { 
      xSpeed *=-1;
    }
    if(y<btnH || y>height-size) { 
      ySpeed *=-1; 
    }
    
    boolean hDirection = (xSpeed > 0) ? true : false;
    if(hDirection) {
      pushMatrix();
      translate(x,y);
      scale(1, 1);
      image(fishImg, 0, 0, size, size);
      popMatrix();      
    } else {
      pushMatrix();
      translate(x,y);
      scale(-1, 1);
      image(fishImg, -size, 0, size, size);
      popMatrix();
    }
}


void mouseClicked() {
  if(mouseY > 0 && mouseY < 50 && fishCounter<10){
    if(mouseX > 0 && mouseX < btnW*1){
      // press random button
      // setup a fish
      setupFish();
    } else if(mouseX > btnW*1 && mouseX < btnW*2){
      // press small button

    } else if(mouseX > btnW*2 && mouseX < btnW*3){
      // press medium button
      
    } else if(mouseX > btnW*3 && mouseX < btnW*4){
      // press large button
      
    } 
  }  
}