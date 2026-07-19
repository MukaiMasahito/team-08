class Coin {
  float x;
  float y;
  float size;
  float speed;

  float laneOffset;

  int value;
  boolean isRare;

  Coin() {
    reset();
  }

  void reset() {
    size = 20;
    y = 0;

    // 10％の確率で高得点コイン
    isRare = random(100) < 10;

    if (isRare) {
      value = 50;
      speed = random(10, 14);
      size = 26;
    } else {
      value = 10;
      speed = random(5, 8);
    }

    laneOffset = random(-45, 45);
    x = width / 2 + laneOffset;
  }

  void update(float highSpeed) {
    y += speed * highSpeed;

    if (isRare) {
      speed += 0.05 * highSpeed;
      size += 0.25 * highSpeed;
    } else {
      speed += 0.02 * highSpeed;
      size += 0.15 * highSpeed;
    }

    float spread = map(y, 50, height, 1, 5);
    x = width / 2 + laneOffset * spread;
  }

  void display() {
    noStroke();

    if (isRare) {
      // 高得点コイン：虹色っぽく点滅
      float flash = sin(frameCount * 0.25) * 40;

      fill(120 + flash, 220, 255);
      ellipse(x, y, size * 1.25, size * 1.25);

      fill(255, 80, 180);
      ellipse(x, y, size, size);

      fill(255, 230, 80);
      ellipse(x, y, size * 0.72, size * 0.72);

      fill(255);
      textAlign(CENTER, CENTER);
      textSize(size * 0.45);
      text("50", x, y);

      textAlign(LEFT);
    } else {
      // 普通のコイン
      fill(180, 120, 0);
      ellipse(x, y, size, size);

      fill(255, 190, 0);
      ellipse(x, y, size * 0.85, size * 0.85);

      fill(255, 215, 50);
      ellipse(x, y, size * 0.65, size * 0.65);

      fill(220, 145, 0);
      ellipse(x, y, size * 0.28, size * 0.28);

      fill(255, 255, 180);
      ellipse(
        x - size * 0.22,
        y - size * 0.22,
        size * 0.18,
        size * 0.12
      );
    }
  }
}
