Population pop;
Slider slider;
boolean stopped;

void setup() {
  size(1000, 800);
  
  final String GOAL = "to be or not to be"; //must be all lowercase and spaces
  pop = new Population(50, GOAL.length(), GOAL);
  
  slider = new Slider();
  
  stopped = false;
  
  textAlign(CENTER);
}

void draw() {
  
  if (stopped) {
    pop.displayGen();
    fill(0, 200, 0);
    text("Success after " + pop.genNum + " generations", width / 2, 125);
  }
  else {
    stopped = pop.checkGoal();
  }
  slider.drawSlider();
}
  
void mousePressed() {
  slider.setHeld();
  slider.startX = mouseX;
  slider.moveSlider = slider.inSlider();
}

void mouseReleased() {
  slider.setNotHeld();
  slider.moveSlider = false;
}

/*void keyPressed() {
  if (key == ' ') stopped = true;
}*/
