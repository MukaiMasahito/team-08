class Snake extends Obstacle{

  Snake(){
    damage = 1;
  }
  
  void display() {
    rectMode(CENTER);
    fill(80, 255, 80);
    rect(x, y, size, size);
  }
}
