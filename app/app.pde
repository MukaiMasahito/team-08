Game game;
void setup() {
  size(600, 800);
  game = new Game();
}

void draw(){
  game.update();
}
