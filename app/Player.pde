class Player {

  float x;
  float y;
  float speed = 7;
  float r = 25;
  int hp;
  boolean movingLeft = false;
  boolean movingRight = false;
  
  
  float shockRadius = 0;
  boolean shockActive = false;

  int damageValue = 0;
  float damageTextY;
  int damageTimer = 0;
  

  Player() {
    x = width/2;
    y = height - 200;
    hp = 100;
  }

void update(float highSpeed) {
  if (movingLeft) {
    x -= speed * (highSpeed);
  }

  if (movingRight) {
    x += speed * highSpeed;
  }

  // プレイヤーの高さに合わせた道の左右端
  float roadHalfWidth = map(y, 0, height, 60, width / 2);

  float roadLeft = width / 2 - roadHalfWidth;
  float roadRight = width / 2 + roadHalfWidth;

  x = constrain(x, roadLeft + r, roadRight - r);
  
  // 衝撃波
  if (shockActive) {
    shockRadius += 18;
    if (shockRadius > 180) {
      shockActive = false;
    }
  }
  // ダメージ文字
  if (damageTimer > 0) {
    damageTimer--;
    damageTextY -= 1.2;
  }
}

  void display() {
    // プレイヤー
    fill(50, 100, 255);
    ellipse(x, y, r*2, r*2);
    // 衝撃波
    if (shockActive) {
      noFill();
      stroke(255,0,0,map(shockRadius,r*2,180,255,0));
      strokeWeight(5);
      ellipse(x,y,shockRadius,shockRadius);
      noStroke();
    }
    // ダメージ文字
    if (damageTimer > 0) {
      fill(255,0,0);
      textAlign(CENTER);
      textSize(28);
      text("-" + damageValue, x, damageTextY);
    }
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
    DamageEffect(damage);
    if (hp < 0) {
      hp = 0;
    }
  }
  
  void DamageEffect(int damage)
  {
    shockRadius = r * 2;
    shockActive = true;

    damageValue = damage;
    damageTextY = y - 40;
    damageTimer = 40;
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
