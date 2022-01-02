class Bullets{
  float bulletX;
  float bulletY;
  float bulletSpeed;
  float bulletSize;
  
  Bullets(float x, float y){
    bulletX = x;
    bulletY = y;
    bulletSpeed = -3;
    bulletSize = 20;
  }
  
  void drawBullets(){
    fill(50);
    circle(bulletX, bulletY, bulletSize);
  }
  
  void moveBullets(){
    bulletY += bulletSpeed;
  }
  
}
