PImage bg;
PImage groundhog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;

int soldierX;
int soldierY;
float soldierXSpeed = 5;
boolean soldierExist;

int robotX;
int robotY;

float laserX = robotX+25;
float laserY = robotY+37;
int laserSpeedX = 2;

void setup() {
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");
  soldierExist  = false;
  robotX = int(random(160, 560));

  //robotPosition
  int a = int(random(1, 5));
  if (a==1) {
    robotY=400;
  } else if (a==2) {
    robotY=320;
  } else if (a==3) {
    robotY=240;
  } else if (a==4) {
    robotY=160;
  }
}

void draw() {
  background(bg);
  image(soil, 0, 160); //soil

  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, 145, 640, 15); 

  //sun
  ellipseMode(CENTER);
  fill(255, 255, 0);
  ellipse(590, 50, 125, 125);
  fill(253, 184, 19);
  ellipse(590, 50, 120, 120); 

  image(groundhog, 280, 80); //groundhog

  //life
  for (int x = 0; x < 3; x ++) {
    pushMatrix();
    translate(x*70, 0);
    image(life, 10, 10);
    popMatrix();
  }

  //soldierRandomFloor
  if (soldierExist == false) {
    int a = int(random(1, 5));
    soldierExist = true;
    if (a==1) {
      soldierY=400;
    } else if (a==2) {
      soldierY=320;
    } else if (a==3) {
      soldierY=240;
    } else if (a==4) {
      soldierY=160;
    }
  }

  //soldierMove
  image(soldier, soldierX, soldierY);
  soldierX += soldierXSpeed;
  if (soldierX>=640) {
    soldierX %= (640+40);
    soldierExist = false;
  }

  image(robot, robotX, robotY);//robot

  //laser
  laserY = robotY+37;
  noStroke();
  fill(255, 0, 0);
  ellipse(laserX, laserY, 10, 10);
  ellipse(laserX-30, laserY, 10, 10);
  rect(laserX-32, laserY-5, 30, 10); 
  laserX -= laserSpeedX;

  //resetlaser
  if (laserX <= 0) {
    laserX = robotX+25;
  }
}
