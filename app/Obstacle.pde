abstract class Obstacle {

  float x;
  float y;
  float speed;
  float size = 40;
  int damage;

  Obstacle() {
    x = random(size/2, width-size/2);
    y = -40;
    speed = random(5, 10);
  }

  void update() {
    y += speed;
  }

  abstract void display();
}
