class Player {

  float x;
  float y;
  float speed = 7;
  float r = 25;
  float hp;
  boolean movingLeft = false;
  boolean movingRight = false;

  Player() {
    x = width/2;
    y = height - 200;
    hp = 100;
  }

void update() {
  if (movingLeft) {
    x -= speed;
  }

  if (movingRight) {
    x += speed;
  }

  // プレイヤーの高さに合わせた道の左右端
  float roadHalfWidth = map(y, 0, height, 60, width / 2);

  float roadLeft = width / 2 - roadHalfWidth;
  float roadRight = width / 2 + roadHalfWidth;

  x = constrain(x, roadLeft + r, roadRight - r);
}

  void display() {
    fill(50, 100, 255);
    ellipse(x, y, r*2, r*2);
  }

  boolean hit(Obstacle o) {

    float d = dist(x, y, o.x, o.y);

    return d < r + o.size/2;
  }
  
  boolean collect(Coin c) {
    float d = dist(x, y, c.x, c.y);

    return d < r + c.size/2;
  }
  
  void Damage(int damage)
  {
    hp -= damage;

  if (hp < 0) {
    hp = 0;
  }
  }
  void pressKey(int code) {
  if (code == LEFT) {
    movingLeft = true;
  }

  if (code == RIGHT) {
    movingRight = true;
  }
}

void releaseKey(int code) {
  if (code == LEFT) {
    movingLeft = false;
  }

  if (code == RIGHT) {
    movingRight = false;
  }
}
}
