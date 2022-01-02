class Cannon{
  float cannonX;
  float cannonY;
  PImage cannon;
  float w;
  float h;
 
  
  void setCannon(float startCannonX, float startCannonY){
    cannonX = startCannonX;
    cannonY = startCannonY;
    cannon = loadImage("midterm cannon.png");
    w = 125;
    h = 125;
  }
  
  void drawCannon(){
    //fill(255);
    //rect(cannonX, cannonY, 50, 150);
    image(cannon, cannonX-w/2, cannonY-h/2,w,h);
  }
  
  //source for code help: https://processingtutorials-wordpress-com.cdn.ampproject.org/v/s/processingtutorials.wordpress.com/2013/05/30/space-invaders-code-2/amp/?usqp=mq331AQFKAGwASA%3D&amp_js_v=0.1#aoh=16042877427707&referrer=https%3A%2F%2Fwww.google.com&amp_tf=From%20%251%24s&ampshare=https%3A%2F%2Fprocessingtutorials.wordpress.com%2F2013%2F05%2F30%2Fspace-invaders-code-2%2F
  void shooting(){
    Bullets bllet = new Bullets(cannonX,cannonY);
    bullets.add(bllet);
  }
  
}
