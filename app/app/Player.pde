class Player {

  float x;
  float y;
  float speed = 7;
  float r = 25;
  float hp;

  Player() {
    x = width/2;
    y = height - 80;
    hp = 100;
  }

  void update() {

    if (keyPressed) {

      if (keyCode == LEFT) {
        x -= speed;
      }

      if (keyCode == RIGHT) {
        x += speed;
      }
    }

    x = constrain(x, r, width-r);
  }

  void display() {
    fill(50, 100, 255);
    ellipse(x, y, r*2, r*2);
  }

  boolean hit(Obstacle o) {

    float d = dist(x, y, o.x, o.y);

    return d < r + o.size/2;
  }
  
  void Damage(int damage)
  {
    hp -= damage;
  }
}
