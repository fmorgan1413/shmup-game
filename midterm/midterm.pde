import processing.sound.*;
SoundFile fire;
SoundFile dyingAlien;
SoundFile dying;

PFont font;

Cannon player;
Enemy[] aliens = new Enemy[3];
ArrayList bullets;
String state;
int lives;
int timer;
//image made in paint 3d
PImage background;
PImage gameover;

void setup(){
  size(600,600);
  lives = 3;
  timer = 0;
  player = new Cannon();
  player.setCannon(width/2, 500);
  bullets = new ArrayList();
  for(int i=0; i<aliens.length; i++){
    aliens[i] = new Enemy();
    float x = random(0,width);
    aliens[i].setupAliens(x, 0, random(1,3));
  }
  
  font = createFont("Take Coffee.ttf",18);
  fire = new SoundFile(this,"448226__inspectorj__explosion-8-bit-01.wav");
  dyingAlien = new SoundFile(this, "537021__fivebrosstopmosyt__alien-grunt-1.wav");
  dying = new SoundFile(this, "648969__atomediadesign__dying.wav");
  background = loadImage("midterm background.png");
  gameover = loadImage("midterm game over screen.png");
  state = "title";
}

void draw(){
  //background(0);
  if(state == "title"){
    image(background, 0,0,600,600);
    title();
  }
  if(state == "game"){
    image(background, 0,0,600,600);
    drawGame();
  }
  if(state == "game over"){
    image(gameover, 0,0,600,600);
    gameover();
  }
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      player.cannonX = player.cannonX - 75;
      if(player.cannonX <= 0){
        player.cannonX = 0;
      }
    }
    if(keyCode == RIGHT){
      player.cannonX = player.cannonX + 75;
      if(player.cannonX >= 550){
        player.cannonX = 600;
      }
    }
  }
  if(state == "game")
  {
    if(key == ' '){
      player.shooting();
      fire.play();
    }
  }
  if(key == 's' && state == "title"){
    state = "game";
  }
  if(key == 's' && state == "game over"){
    lives = 3;
    timer = 0;
    for(int i=0; i<aliens.length; i++){
      
      aliens[i] = new Enemy();
      float x = random(0,width);
      aliens[i].setupAliens(x, 0, random(1,3));
    }
    state ="game";
  }
} 

//source for code help: https://processingtutorials-wordpress-com.cdn.ampproject.org/v/s/processingtutorials.wordpress.com/2013/05/30/space-invaders-code-2/amp/?usqp=mq331AQFKAGwASA%3D&amp_js_v=0.1#aoh=16042877427707&referrer=https%3A%2F%2Fwww.google.com&amp_tf=From%20%251%24s&ampshare=https%3A%2F%2Fprocessingtutorials.wordpress.com%2F2013%2F05%2F30%2Fspace-invaders-code-2%2F
//carries into cannon class 
void bullet(){
  for(int i=0; i <bullets.size(); i++){
    Bullets bllet = (Bullets) bullets.get(i);
    bllet.moveBullets();
    bllet.drawBullets();
  }
}

void drawGame(){
  timer++;
  stroke(255);
  line(0,400,600,400);
  stroke(0);
  textSize(30);
  textFont(font);
  fill(255);
  text("survival time: " + timer/5 + "." +timer%5, 20, 40);
  text("lives: " +lives, 20, 80);

  
  bullet();
  player.drawCannon();
  for(int i=0; i<aliens.length; i++){
    aliens[i].moveAliens();
    aliens[i].drawAliens();
    aliens[i].checkCollision();
    aliens[i].crossTerritory();
  }
   
  if(lives == 0){
    state = "game over";
  }
}

void title(){
  textFont(font);
  textSize(50);
  text("ALIEN SHOOTER",75,150);
  textSize(20);
  text("OBJECTIVE: keep the aliens from landing on earth", 45, 250);
  textSize(15);
  text("press s to get in the field", 200, 340);
  text("use the left and right arrow keys to move your tank",110, 380);
  text("press space to shoot", 205, 420);
}

void gameover(){
  fill(255);
  textSize(30);
  text("GAME OVER", width/2, 280);
  textSize(15);
  text("you survived for: "+ timer/5 + "." +timer%5+" secs",width/2,310);
  text("press s to get back in the field", width/2, 330);
}
