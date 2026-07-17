Game game;

void setup() {
  size(600, 800);
  game = new Game();
}

void draw() {
  game.update();
}
void keyPressed() {

  // タイトル画面中
  if (!game.isStarted) {
    if (key == ' ') {
      game.isStarted = true;

      // 開始時にキーの状態を初期化
      game.player.movingLeft = false;
      game.player.movingRight = false;
    }

    return;
  }

  // ゲーム中の左右移動
  if (!game.isGameOver) {
    if (keyCode == LEFT) {
      game.player.movingLeft = true;
    }

    if (keyCode == RIGHT) {
      game.player.movingRight = true;
    }
  }

  // ゲームオーバー後にRでタイトルへ戻る
  if (game.isGameOver && (key == 'r' || key == 'R')) {
    game.initGame();
  }
}

void keyReleased() {

  if (keyCode == LEFT) {
    game.player.movingLeft = false;
  }

  if (keyCode == RIGHT) {
    game.player.movingRight = false;
  }
}
