class Coin {
  float x;
  float y;
  float size;
  float speed;

  int value;

  Coin() {
    x = random(size/2, width-size/2);
    y = -40;
    size = 20;
    speed = random(5, 10);
    value = 10;
  }

  void display() {
    rectMode(CENTER);
    fill(255, 255, 80);
    ellipse(x, y, size, size);
  }
  
  void update() {
    y += speed;
  }
  
}
