class Bear extends Obstacle{
  
  Bear()
  {
    damage = 1000;
  }
  

void display() {
  noStroke();

  // 影
  fill(0, 40);
  ellipse(x, y + size * 0.55,
          size * 1.25, size * 0.35);

  // 奥側の足
  fill(110, 65, 30);
  ellipse(x + size * 0.3, y + size * 0.4,
          size * 0.35, size * 0.55);

  ellipse(x - size * 0.25, y + size * 0.4,
          size * 0.35, size * 0.55);

  // 体
  fill(145, 85, 40);
  ellipse(x, y + size * 0.1,
          size * 1.15, size * 0.75);

  // お腹
  fill(185, 125, 70);
  ellipse(x - size * 0.05, y + size * 0.2,
          size * 0.65, size * 0.45);

  // 前足
  fill(155, 90, 40);
  ellipse(x - size * 0.38, y + size * 0.35,
          size * 0.3, size * 0.65);

  ellipse(x + size * 0.38, y + size * 0.35,
          size * 0.3, size * 0.65);

  // 手
  fill(120, 70, 35);
  ellipse(x - size * 0.38, y + size * 0.62,
          size * 0.35, size * 0.2);

  ellipse(x + size * 0.38, y + size * 0.62,
          size * 0.35, size * 0.2);

  // 耳
  fill(110, 65, 30);
  ellipse(x - size * 0.32, y - size * 0.42,
          size * 0.35, size * 0.35);

  ellipse(x + size * 0.32, y - size * 0.42,
          size * 0.35, size * 0.35);

  // 耳の中
  fill(185, 125, 70);
  ellipse(x - size * 0.32, y - size * 0.42,
          size * 0.18, size * 0.18);

  ellipse(x + size * 0.32, y - size * 0.42,
          size * 0.18, size * 0.18);

  // 顔
  fill(155, 90, 40);
  ellipse(x, y - size * 0.15,
          size * 0.9, size * 0.8);

  // 顔のハイライト
  fill(170, 105, 50);
  ellipse(x - size * 0.12, y - size * 0.25,
          size * 0.55, size * 0.4);

  // 目
  fill(20);
  ellipse(x - size * 0.18, y - size * 0.22,
          size * 0.08, size * 0.1);

  ellipse(x + size * 0.18, y - size * 0.22,
          size * 0.08, size * 0.1);

  // 口まわり
  fill(220, 180, 130);
  ellipse(x, y - size * 0.03,
          size * 0.42, size * 0.32);

  // 鼻
  fill(30);
  ellipse(x, y - size * 0.08,
          size * 0.15, size * 0.1);

  // 口
  stroke(50);
  strokeWeight(2);
  line(x, y - size * 0.03,
       x, y + size * 0.05);

  line(x, y + size * 0.05,
       x - size * 0.08, y + size * 0.09);

  line(x, y + size * 0.05,
       x + size * 0.08, y + size * 0.09);

  noStroke();
}
>>>>>>> 0c1c2fb (プレイヤーをクマの見た目に変更)
}
