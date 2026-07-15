class Snake extends Obstacle {
  PImage img; // 画像を保存する変数

  Snake() {
    damage = 1;
    // dataフォルダ内の画像を読み込みます（ファイル名は保存名に合わせてください）
    img = loadImage("snake.png"); 
  }
  
  void display() {
    // 画像の描画基準点を中心（CENTER）に設定します（元のrectMode(CENTER)と同様の効果）
    imageMode(CENTER); 
    
    // 指定された座標(x, y)に、指定されたサイズ(size, size)で画像を描画します
    image(img, x, y, size, size);
  }
}
