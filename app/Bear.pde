class Bear extends Obstacle{
  
  Bear()
  {
    damage = 1000;
  }
  
void display() {
  // 耳
  fill(120, 70, 30);
  ellipse(x - size * 0.3, y - size * 0.45,
          size * 0.35, size * 0.35);
  ellipse(x + size * 0.3, y - size * 0.45,
          size * 0.35, size * 0.35);

  // 体
  fill(150, 90, 40);
  ellipse(x, y + size * 0.45,
          size * 0.8, size * 1.0);

  // 腕
  ellipse(x - size * 0.45, y + size * 0.35,
          size * 0.25, size * 0.65);
  ellipse(x + size * 0.45, y + size * 0.35,
          size * 0.25, size * 0.65);

  // 足
  ellipse(x - size * 0.25, y + size * 0.85,
          size * 0.35, size * 0.3);
  ellipse(x + size * 0.25, y + size * 0.85,
          size * 0.35, size * 0.3);

  // 顔
  ellipse(x, y - size * 0.1,
          size, size);

  // 目
  fill(0);
  ellipse(x - size * 0.2, y - size * 0.2,
          size * 0.1, size * 0.1);
  ellipse(x + size * 0.2, y - size * 0.2,
          size * 0.1, size * 0.1);

  // 口まわり
  fill(220, 180, 130);
  ellipse(x, y + size * 0.05,
          size * 0.45, size * 0.35);

  // 鼻
  fill(0);
  ellipse(x, y,
          size * 0.15, size * 0.1);

  // お腹
  fill(220, 180, 130);
  ellipse(x, y + size * 0.5,
          size * 0.45, size * 0.55);
}
}
