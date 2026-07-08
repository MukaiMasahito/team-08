class Game {
  Player player;
  Coin[] coins;
  Obstacle[] obstacles;

  int score;
  boolean isGameOver;
  boolean isStarted;

  Game() {
    start();
  }

  void start() {
    player = new Player();

    coins = new Coin[5];
    for (int i = 0; i < coins.length; i++) {
      coins[i] = new Coin();
    }

    obstacles = new Obstacle[3];
    for (int i = 0; i < obstacles.length; i++) {
      obstacles[i] = new Obstacle();
    }

    score = 0;
    isGameOver = false;
    isStarted = true;
  }

  void update() {
    if (!isStarted || isGameOver) {
      return;
    }

    player.move();

    for (int i = 0; i < coins.length; i++) {
      coins[i].move();

      if (coins[i].collect(player)) {
        score += 10;
        coins[i].reset();
      }
    }

    for (int i = 0; i < obstacles.length; i++) {
      obstacles[i].move();

      if (player.hitObstacle(obstacles[i])) {
        gameOver();
      }
    }
  }

  void draw() {
    background(180, 220, 255);

    for (int i = 0; i < coins.length; i++) {
      coins[i].draw();
    }

    for (int i = 0; i < obstacles.length; i++) {
      obstacles[i].draw();
    }

    player.draw();

    fill(0);
    textSize(24);
    textAlign(LEFT);
    text("Score : " + score, 20, 35);

    if (isGameOver) {
      fill(255, 0, 0);
      textSize(50);
      textAlign(CENTER);
      text("GAME OVER", width / 2, height / 2);

      fill(0);
      textSize(20);
      text("Press R to Restart", width / 2, height / 2 + 45);
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
