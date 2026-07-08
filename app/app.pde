Player player;
ArrayList<Obstacle> obstacles;

boolean gameOver = false;
int spawnTimer = 0;

void setup() {
  size(600, 800);
  initGame();
}

void initGame() {
  player = new Player();
  obstacles = new ArrayList<Obstacle>();
  gameOver = false;
  spawnTimer = 0;
}

void draw() {
  background(230);

  if (!gameOver) {

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
      }

      // 画面外に出たら削除
      if (o.y > height + 50) {
        obstacles.remove(i);
      }
    }

    fill(0);
    textSize(24);
    text("hp : " + player.hp, 20, 40);

  } else {

    player.display();

    for (Obstacle o : obstacles) {
      o.display();
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

void keyPressed() {
  if (key == 'r' || key == 'R') {
    initGame();
  }
}
