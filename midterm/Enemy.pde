class Enemy{
  float x;
  float y;
  float velY;
  float alienSize = 50;
  float w;
  float h;
  boolean hit = false;
  int lane;
  
  //images made in paint 3d
  PImage alien;
  PImage brokenAlien;
  
  
  void setupAliens(float startX, float startY, float startVelY){
    x = startX;
    y = startY;
    w = 100;
    h = 100;
    velY = startVelY;
    alien = loadImage("midterm enemy.png");
    brokenAlien = loadImage("midtem breaking enemy.png");
  }
  
  void moveAliens(){
    y += velY;
    if (y > height){
     lane = (int) random(0,22);
     x = lane*75;
     y = 0;
     velY = random(2,3);
    } 
  }
  
  void drawAliens(){
    //fill(100);
    //circle(x, y, alienSize);
    image(alien,x-w/2,y-h/2,w,h);
  }
  
  void drawBreakingEnemy(){
    image(brokenAlien,x-w/2,y-h/2,w,h);
  }
  
  void checkCollision(){
    for(int i=0; i <bullets.size(); i++){
      Bullets bllet = (Bullets) bullets.get(i);
      float distance = dist(bllet.bulletX, bllet.bulletY, x, y);
      if(distance < bllet.bulletSize/2 + w/2 && distance < bllet.bulletSize/2 + h/2){
        hit = true;
        dyingAlien.play();
        drawBreakingEnemy();
        bllet.bulletX = 1000;
        x = 10000;
        y = random(451,599);
      }
    }
  }
  
  void crossTerritory(){
    if(y<401 && y>399 && x<601){
      dying.play();
      lives--;
    }
  }
}
