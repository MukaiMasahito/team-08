class Bear extends Obstacle{
  
  Bear()
  {
    damage = 1000;
  }
  
  void display() {
    rectMode(CENTER);
    fill(255, 255, 80);
    rect(x, y, size, size);
  }
}
