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
  noStroke();

  // コインの外側
  fill(180, 120, 0);
  ellipse(x, y, size, size);

  // コイン本体
  fill(255, 190, 0);
  ellipse(x, y, size * 0.85, size * 0.85);

  // 内側の円
  fill(255, 215, 50);
  ellipse(x, y, size * 0.65, size * 0.65);

  // 中央の模様
  fill(220, 145, 0);
  ellipse(x, y, size * 0.28, size * 0.28);

  // 光っている部分
  fill(255, 255, 180);
  ellipse(
    x - size * 0.22,
    y - size * 0.22,
    size * 0.18,
    size * 0.12
  );
}
  
  void update() {
    y += speed;
  }
  
}
