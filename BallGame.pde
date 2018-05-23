Ball player;
ArrayList<Ball> enemies;

void setup() {
 size(600, 600); 
 
 //initialize player
 PVector loc = new PVector(50, 150);
 PVector speed = new PVector(0, 0);
 player = new Ball(loc, speed); //new Ball(new PVector(50, 50), new PVector(0,0))
 
 //initialize enemy 
 enemies = new ArrayList();
 Ball enemy1 = new Ball(new PVector(width, 200), new PVector(-3, 0));
 
 enemies.add(enemy1);
}

//called in every frame
void draw() {
 background(255, 255, 255); 
  
 if (frameCount % 60 == 0) {
   enemies.add(new Ball(new PVector(width, random(0,600)), new PVector(-3, 0))); 
 }
 
 //draw player
 noStroke();
 fill(#FFC0CB);
 ellipse(player.loc.x, player.loc.y, 50, 50);
 
 //ENEMIES
 for (Ball enemy : enemies) {
   //move enemies
   enemy.loc.add(enemy.speed);
   
   //check collision 
   float d = PVector.dist(player.loc, enemy.loc); //float d = player.loc.dist(enemy.loc);
   if (d < (25+25)) {
     //the sum of both radius
     background(255, 1, 255);
   } 
   
   //draw enemies
   noStroke();
   fill(#FF0000);
   ellipse(enemy.loc.x, enemy.loc.y, 50, 50);   
 }
}

void mouseMoved() {
 player.loc.set(50, mouseY); 
}