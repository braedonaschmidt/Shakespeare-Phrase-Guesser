public class Slider {
  private int SLIDER_WIDTH = 25;
  private int speedVal, x, y;
  private boolean mouseHeld, moveSlider, atLBound, atRBound;
  int displacement;
  
    int startX;
  
  public Slider() {
    x = width / 2;
    y = height - 80;
    mouseHeld = false;
    moveSlider = false;
    atLBound = false;
    atRBound = false;
  }
  
  //***********************************************
  
  public void drawSlider() {
    rectMode(CENTER);
    rect(width / 2, height - 80, width - 400, 8); //slider rail
    rect(x + displacement, y, SLIDER_WIDTH, SLIDER_WIDTH); //actual slider
    
    moveSlider();
  }
  
  public void setHeld() {
    mouseHeld = true;
  }
  
  public void setNotHeld() {
    mouseHeld = false;
  }
  
  public boolean inSlider() {
    boolean inXBound = (mouseX >= x - SLIDER_WIDTH / 2) && (mouseX <= x + SLIDER_WIDTH / 2);
    boolean inYBound = (mouseY >= y - SLIDER_WIDTH / 2) && (mouseY <= y + SLIDER_WIDTH / 2);
    return inXBound && inYBound;
  }
  
  public void moveSlider() {
    if (x + displacement <= 200) atLBound = true;
    else if (x + displacement >= width - 200) atRBound = true;
    
    if (mouseHeld && moveSlider) {
      displacement = mouseX - startX;
    }
    else if ((displacement < 0 && atLBound) || (displacement > 0 && atRBound)) {
      displacement = 0;
      x = (atLBound)? 200: width - 200;
    }
    else {
      x += displacement;
      displacement = 0;
    }
  }
}
