class Game {
  Player player;
  ArrayList<Obstacle> obstacles;
  ArrayList<Coin> coins;
  
  // dataフォルダ内の画像を読み込みます（ファイル名は保存名に合わせてください）
  PImage snakeImage = loadImage("snake.png"); 

  int score;
  float highSpeed;
  float maxHighSpeed;
  boolean isGameOver;
  boolean isStarted;

  int clearScore = 300;
  int spawnTimer = 0;
  
  float roadLineOffset = 0;
  float treeOffset = 0;
  int coinEffectTimer = 0;
  float effectX;
  float effectY;
  int effectValue;
  
  int damageEffectTimer = 0;
  float damageX;
  float damageY;
  int damageValue;

  Game() {
    initGame();
  }

  void initGame() {
  player = new Player();
  obstacles = new ArrayList<Obstacle>();
  coins = new ArrayList<Coin>();

  score = 0;
  highSpeed = 1;
  maxHighSpeed = 1;
  spawnTimer = 0;
  
  coinEffectTimer = 0;
  effectValue = 0;
  
   // ダメージ表示をリセット
  damageEffectTimer = 0;
  damageValue = 0;
  damageX = 0;
  damageY = 0;


  isGameOver = false;
  isStarted = false;
}

  void update() {
    drawRoad(highSpeed);

   if (!isStarted) {
    drawTitleScreen();
    return;
  }
    if (!isGameOver) {

      // 障害物生成
      spawnTimer++;
      if (spawnTimer > 30) {
        if (int(random(2)) == 0)
        {
            obstacles.add(new Snake(snakeImage));
            obstacles.add(new Snake(snakeImage));
        }
        else
        {
            obstacles.add(new Bear());
        }
        coins.add(new Coin());
        spawnTimer = 0;
      }


      
      // プレイヤー更新
      player.update(highSpeed);
      player.display();

      // 障害物更新
for (int i = obstacles.size()-1; i >= 0; i--) {
  Obstacle o = obstacles.get(i);
  // 衝突判定
  if (player.hit(o)) {

    player.Damage(o.damage);

    // ダメージエフェクト
    damageX = player.x;
    damageY = player.y;
    damageValue = o.damage;
    damageEffectTimer = 30;

    // スピードダウン
    highSpeed -= 0.2;

    if (highSpeed < 1) {
      highSpeed = 1;
    }

    // 当たった障害物を削除
    obstacles.remove(i);

    if (player.hp <= 0) {
      gameOver();
    }

    continue;
  }

  o.update(highSpeed);
  o.display();

  // 衝突判定
  

  // 画面外に出たら削除
  if (o.y > height + 50) {
    obstacles.remove(i);
  }
}
  
      // コイン更新
      for (int i = coins.size()-1; i >= 0; i--) {
        Coin c = coins.get(i);
        c.update(highSpeed);
        c.display();
      
        // 衝突判定
      if (player.collect(c)) {
          score += c.value;
  
  // スピードアップ
  highSpeed += 0.01;
  if (maxHighSpeed < highSpeed)
  {
    maxHighSpeed = highSpeed;
  }

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
textAlign(LEFT);
textSize(24);
text("HP : " + player.hp, 20, 40);
text("SPEED : " + ((int)(highSpeed*100)-90) + "km/h", 20, 70);
text("Score : " + score, 20, 100);

drawCoinEffect();
drawDamageEffect();

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
      text("GAME OVER", width/2, height/2 - 100);
      
      textSize(24);
      text("SCORE:" + score + "  MAX SPEED:" + ((int)(maxHighSpeed*100)-90) + "km/h", width/2, height/2);
      text("Press R to Restart", width/2, height/2 + 100);

      textAlign(LEFT);
    }
  }

  void gameOver() {
    isGameOver = true;
  }

 void drawRoad(float highSpeed) {
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

  // 道路脇の木を動かす
  treeOffset += 10 * highSpeed;

  if (treeOffset > 130) {
    treeOffset = 0;
  }

  for (float treeY = -130 + treeOffset;
       treeY < height + 130;
       treeY += 130) {

    float roadHalfWidth = map(
      treeY,
      0,
      height,
      60,
      width / 2
    );

    float treeSize = map(
      treeY,
      0,
      height,
      12,
      75
    );

    float leftTreeX =
      width / 2 - roadHalfWidth - treeSize * 0.45;

    float rightTreeX =
      width / 2 + roadHalfWidth + treeSize * 0.45;

    drawTree(leftTreeX, treeY, treeSize);
    drawTree(rightTreeX, treeY, treeSize);
  }

  // 中央線を動かす
  roadLineOffset += 12 * highSpeed;

  if (roadLineOffset > 120) {
    roadLineOffset = 0;
  }

  fill(120, 120, 120);
  rectMode(CENTER);

  for (float y = -120 + roadLineOffset;
       y < height;
       y += 120) {

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
  void drawTree(float x, float y, float treeSize) {

  noStroke();

  // 幹
  fill(110, 70, 35);
  rectMode(CENTER);
  rect(x, y + treeSize * 0.2,
       treeSize * 0.2,
       treeSize * 0.6);

  // 葉
  fill(40, 150, 60);
  ellipse(x, y, treeSize, treeSize);

  fill(60, 180, 80);
  ellipse(x - treeSize * 0.2,
          y - treeSize * 0.2,
          treeSize * 0.7,
          treeSize * 0.7);

  ellipse(x + treeSize * 0.2,
          y - treeSize * 0.2,
          treeSize * 0.7,
          treeSize * 0.7);
}

void drawTitleScreen() {

  PFont font = createFont("MS Gothic", 32);
  textFont(font);

  fill(0, 150);
  rectMode(CORNER);
  rect(0, 0, width, height);

  textAlign(CENTER);

  fill(255, 220, 0);
  textSize(52);
  text("FOREST RUN", width / 2, 220);

  fill(255);
  textSize(22);
  text("クマやヘビをよけてコインを集めよう！",
       width / 2, 280);

  textSize(20);
  text("← → キー：左右移動",
       width / 2, 380);

  text("コインを取るとスコアアップ・スピードアップ",
       width / 2, 420);

  text("敵に当たるとHPが減り、スピードダウンする",
       width / 2, 460);

  if ((frameCount / 30) % 2 == 0) {
    fill(255, 240, 100);
    textSize(30);
    text("SPACEキーでスタート",
         width / 2, 600);
  }

  textAlign(LEFT);
}

void drawDamageEffect() {

  if (damageEffectTimer > 0) {

    noFill();
    stroke(255, 0, 0);
    strokeWeight(5);

    float r = map(damageEffectTimer, 30, 0, 20, 90);
    ellipse(damageX, damageY, r, r);

    fill(255, 50, 50);
    textAlign(CENTER);
    textSize(28);

    text("-" + damageValue + " HP", damageX, damageY - 15);

    damageY -= 2;

    damageEffectTimer--;

    textAlign(LEFT);
    noStroke();
  }
}
}
