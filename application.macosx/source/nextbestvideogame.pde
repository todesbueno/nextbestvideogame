//global variables
PImage hero, bill, bg, explosion;
int heroX = 45, heroY = 230; //coordinates of hero
int heroSpeed = 15, billSpeed = 5; //speeds of hero & bill
int billX = 1700, billY = 5000; //coordinates of bill
int lives = 100; //lifecount

//setting up assets
void setup()
{
  bg = loadImage("bg.jpg"); //background image
  image(bg, 0, 0); //background coordinates
  size(bg.width, bg.height); //background size

  hero = loadImage("hero.png"); //hero image
  bill = loadImage("bill.png"); //bill image
  explosion = loadImage("explosion.png"); //explosion image
  textSize(30); //lifecount text
  fill(255); //lifecount text colour
}
void draw() {
  image(bg, 0, 0); //load background image

  image(hero, heroX, heroY, hero.width/7.5, hero.height/7.5); //spawn hero

  image (bill, billX, billY, bill.width/2, bill.height/2); //spawn bill
  text(lives, 540, 25); //lifecount text coordinates
  billX-=billSpeed; //decrements bill's horizontal position by billSpeed
  
  //COLLISION!
  if (overlapping()) { //if overlapping then
    lives--; //lives decrease
    image(explosion, heroX-100, heroY-25, explosion.width/7, explosion.height/7); //explosion image spawned on top of hero


    /* println("overlap");
     } else {
     println("no overlap");   shows collision in console*/
  }


//Gameover condition
  if (lives < 0)
  {
    gameOver();
  }
}

//controls
void keyPressed() //when a key is pressed
{
  if (keyCode == UP && heroY > 0) { //moves hero up with upper border
    heroY-=heroSpeed; //decrements hero's vertical position by heroSpeed
  }

  if (keyCode == DOWN && heroY < 230) {//moves hero down with lower border
    heroY+=heroSpeed; //increments hero's vertical position by heroSpeed
  }

  if (keyCode == BACKSPACE) // spawns bill
  {
    spawnBill();
  }
}


//how to spawn bill
void spawnBill()
{
  billX = 500; //bill's x coordinates on spawn
  billY = round(random(0, bg.height-120)); //bill's y coordinates on spawn; randomized (>round to convert float [Kommazahl] to integer [Ganze Zahl]) with 0<x<120)
  // println("Bill spawned"); show's text in console
}

//Gameover state
void gameOver() {

  text("GAME OVER!!!", width/3, height/2);  //text that shows
  noLoop(); //this ends the draw loop
}

//collision detection
boolean overlapping()
{
  // Homemade algorithm for deciding if bill and hero overlap
  return  billX < heroX + hero.width/7.5 
    && billX + bill.width/2 > heroX
    && billY < heroY + hero.height/7.5
    && billY + bill.height/2 > heroY;
}

