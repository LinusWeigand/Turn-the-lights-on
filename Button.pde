public class Button{
  private String text;
  private int x, y, w, h;//Dimension des Buttons
  private color blue, darkBlue, black, white;
  private boolean pressed = false;
  private ActionListener action;
  
  public Button(String t){
    text = t;
    blue = color(0, 100, 255);
    darkBlue = color(0, 40, 200);//TODO Farben anschauen
    black = color(0, 0, 0);
    white = color(255, 255, 255);
    //red = 255;
    //green = 100;
    //blue = 0;
  }
  
  public Button(String t, ActionListener action){
    this(t);
    this.action = action;
  }
  
  public void setBounds(int x, int y, int w, int h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  public void draw(){
    //dunkel blue, wenn Maus im Buttonbereich und Maus gedrückt; ansonsten blue
    //weiss, wenn Maus im Buttonbereich; ansonsten schwarz

    if(pressed && isInBounds()){
      fill(darkBlue);
    }else{
      fill(blue);
    }
    strokeWeight(3);//Randstaerke
    stroke(black);
    rect(x, y, w, h);
    if(isInBounds()){
      fill(white);
    }else{
      fill(black);
    }
    textSize(20);
    textAlign(CENTER, CENTER);
    text(text, x + w/2, y + h/2);
  }
  
  public void mousePressed(){
    if(isInBounds()){
      pressed = true;
    }
  }
  public void mouseReleased(){
    if(isInBounds() && pressed && action != null){
      action.actionPerformed(this);
    }
    pressed = false;
  }
  private boolean isInBounds(){
    //linker Rand; rechter Rand; oberer Rand; unterer Rand
    return (x <= mouseX && x+w >= mouseX && y <= mouseY && y+h >= mouseY);
  }
  //Getter Methoden
  public String getText(){
    return text;
  }
  public int getX(){
    return x;
  }
  public int getY(){
    return y;
  }
  public int getWidth(){
    return w; 
  }
  public int getHeight(){
    return h;
  }
  //Setter Methoden
  public void setText(String t){
    text = t;
  }
}
