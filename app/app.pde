Game game;

void setup() {
  size(600, 800);
  game = new Game();
}

void draw() {
  game.update();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      game.player.movingLeft = true;
    }

    if (keyCode == RIGHT) {
      game.player.movingRight = true;
    }
  }

  if (key == 'r' || key == 'R') {
    game.initGame();
  }
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == LEFT) {
      game.player.movingLeft = false;
    }

    if (keyCode == RIGHT) {
      game.player.movingRight = false;
    }
  }
}
