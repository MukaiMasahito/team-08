class Coin {
  float x;
  float y;
  float speed;

  int value;

  PImage image;

  int size = 40;
Coin(float x, float y, float speed, PImage img) {
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.image = img;
    this.value = 10;
  }
  void move() {
    y += speed;

    //画面外へ出たら上へ戻す
    if (y > height) {
      reset();
    }
  }
  void draw() {
    image(image, x, y, size, size);
  }
  boolean collect(Player player) {

    if (player.x < x + size &&
      player.x + player.width > x &&
      player.y < y + size &&
      player.y + player.height > y) {

      //スコア加算
      player.score += value;

      //新しい位置へ
      reset();

      return true;
    }
    
    return false;
  }
  // コインを上に再配置
  void reset() {
    x = random(50, width - 50);
    y = random(-400, -50);
  }
}
