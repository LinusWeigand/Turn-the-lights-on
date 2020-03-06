public class RestartActionListener implements ActionListener{
  private Main m;
  public RestartActionListener(Main m){
    this.m = m;
  }
  
  public void actionPerformed(Button b){
    m.startGame();
  }
}
