
class Game {
  Player player;
  ArrayList<Obstacle> obstacles;
  ArrayList<Coin> coins;

  int score;
  boolean isGameOver;
  
  int spawnTimer = 0;

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
    background(230);

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
          
        }

        // 画面外に出たら削除
        if (c.y > height + 50) {
          coins.remove(i);
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

  void keyPressed() {
    if (key == 'r' || key == 'R') {
      start();
    }
  }
}
