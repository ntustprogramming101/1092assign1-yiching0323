PImage bg;
PImage groundhog;
PImage life;
PImage robot;
PImage soil;
PImage soldier;

int soldierX;
int soldierY;
float soldierXSpeed = 5;

int robotX;
int robotY;

float laserX;
float laserY;
float laserWidth;
float laserHeight;
int laserXSpeed;

void setup() {
  size(640, 480, P2D);
  bg = loadImage("img/bg.jpg");
  groundhog = loadImage("img/groundhog.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soil = loadImage("img/soil.png");
  soldier = loadImage("img/soldier.png");

  //robotPosition
  robotX = int(random(160, 560));
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

  //soldierPosition
  soldierX = -80;
  soldierY = floor(random(2, 6))*80;
  soldierXSpeed = 5;

  //laserPosition
  laserX = robotX+25;
  laserY = robotY+37;

  //laserMove
  laserXSpeed = 2;
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

  //soldierMove
  image(soldier, soldierX, soldierY);
  soldierX += soldierXSpeed;
  if (soldierX>=640) {
    soldierX = -80;
  }

  //laser
  laserY = robotY+37;
  noStroke();
  fill(255, 0, 0);
  ellipse(laserX-5, laserY, 10, 10);
  ellipse(laserX-35, laserY, 10, 10);
  rect(laserX-35+2.0/5.0, laserY-5, 30, 10); 

  //laserMove
  laserX -= laserXSpeed;

  //resetlaser
  if (laserX <= robotX-160-25+40) {
    laserX = robotX+25;
  }

  image(robot, robotX, robotY);//robot
}
