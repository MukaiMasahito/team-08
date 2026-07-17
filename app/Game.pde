class Game {
  Player player;
  ArrayList<Obstacle> obstacles;
  ArrayList<Coin> coins;

  int score;
  boolean isGameOver;
  
  int spawnTimer = 0;
  
  float roadLineOffset = 0;
  int coinEffectTimer = 0;
  float effectX;
  float effectY;
  int effectValue;

  Game() {
    initGame();
  }

  void initGame() {
    player = new Player();
    obstacles = new ArrayList<Obstacle>();
    coins = new ArrayList<Coin>();
    isGameOver = false;
    spawnTimer = 0;
  }

  void update() {
    drawRoad();

    if (!isGameOver) {

      // 障害物生成
      spawnTimer++;
      if (spawnTimer > 30) {
        if (int(random(2)) == 0)
        {
            obstacles.add(new Snake());
        }
        else
        {
            obstacles.add(new Bear());
        }
        coins.add(new Coin());
        spawnTimer = 0;
      }


      
      // プレイヤー更新
      player.update();
      player.display();

      // 障害物更新
for (int i = obstacles.size()-1; i >= 0; i--) {
  Obstacle o = obstacles.get(i);

  o.update();
  o.display();

  // 衝突判定
  if (player.hit(o)) {
    player.Damage(o.damage);

    // 当たった障害物を削除
    obstacles.remove(i);

    // HPが0になったらゲームオーバー
    if (player.hp <= 0) {
      gameOver();
    }

    continue;
  }

  // 画面外に出たら削除
  if (o.y > height + 50) {
    obstacles.remove(i);
  }
}

      // コイン更新
      for (int i = coins.size()-1; i >= 0; i--) {
        Coin c = coins.get(i);
        c.update();
        c.display();
      
        // 衝突判定
      if (player.collect(c)) {
  score += c.value;

  // エフェクトの位置と獲得点数を保存
  effectX = c.x;
  effectY = c.y;
  effectValue = c.value;
  coinEffectTimer = 30;

  coins.remove(i);
  coins.add(new Coin());

  continue;
}
        

          // 画面外に出たら削除
        if (c.y > height + 50) {
          coins.remove(i);
        }
      }

      
      fill(0);
textSize(24);
text("HP : " + player.hp, 20, 40);
text("Score : " + score, 20, 70);

drawCoinEffect();

    } else {

      player.display();
 

      for (Obstacle o : obstacles) {
        o.display();
      }
      for (Coin c : coins) {
        c.display();
      }

      fill(0);
      textAlign(CENTER);
      textSize(48);
      text("GAME OVER", width/2, height/2);

      textSize(24);
      text("Press R to Restart", width/2, height/2 + 100);

      textAlign(LEFT);
    }
  }

  void gameOver() {
    isGameOver = true;
  }

  void drawRoad() {
  background(120, 190, 100);

  noStroke();

  // 道
  fill(100);
  quad(
    width/2 - 60, 0,
    width/2 + 60, 0,
    width, height,
    0, height
  );

  // 中央線を動かす
  roadLineOffset += 12;

  if (roadLineOffset > 120) {
    roadLineOffset = 0;
  }

  fill(255, 240, 120);
  rectMode(CENTER);

  for (float y = -120 + roadLineOffset; y < height; y += 120) {

    // 奥では細く、手前では太くする
    float lineWidth = map(y, 0, height, 4, 18);
    float lineHeight = map(y, 0, height, 20, 90);

    rect(
      width/2,
      y,
      lineWidth,
      lineHeight
    );
  }
}
void drawCoinEffect() {

  if (coinEffectTimer > 0) {

    // 円が広がる
    noFill();
    stroke(255, 220, 0);
    strokeWeight(4);

    float r = map(coinEffectTimer, 30, 0, 20, 80);
    ellipse(effectX, effectY, r, r);

    // キラキラ
    strokeWeight(2);

    line(effectX-12, effectY, effectX+12, effectY);
    line(effectX, effectY-12, effectX, effectY+12);

    line(effectX-8, effectY-8, effectX+8, effectY+8);
    line(effectX-8, effectY+8, effectX+8, effectY-8);

    // +10
    fill(255,215,0);
    textAlign(CENTER);
    textSize(30);
    text("+" + effectValue, effectX, effectY - 10);
    // 少し上に移動
    effectY -= 2;

    coinEffectTimer--;

    noStroke();
    textAlign(LEFT);
  }
}
}
