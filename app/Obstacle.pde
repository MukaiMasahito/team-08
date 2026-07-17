abstract class Obstacle {

  float x;
  float y;
  float speed;
  float size;
  int damage;

  // 奥から見たときの左右位置
  float laneOffset;

  Obstacle() {
    y = 50;
    speed = 2;
    size = 15;

    // 道の奥側でランダムに出現
    laneOffset = random(-45, 45);
    x = width / 2 + laneOffset;
  }

  void update() {
    y += speed;

    // 手前に来るほど速くする
    speed += 0.03;

    // 手前に来るほど大きくする
    size += 0.5;

    // 手前に来るほど左右に広がる
    float spread = map(y, 50, height, 1, 5);
    x = width / 2 + laneOffset * spread;
  }

  abstract void display();
}
