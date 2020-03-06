import java.util.Random;//Verwende eine existierende Klasse in Java

private static final int size = 30;
private static final int startX = 60;
private static final int startY = 60;
private Button button;
private boolean[][] field;


void setup(){

  size(500, 500);
  startGame();
  button = new Button("Restart Game", new RestartActionListener(this));
  button.setBounds(20, 10, 200, 40);
}

public void startGame(){
    Random r = new Random();
    //System.out.println("here");
    field = new boolean[10][10];//10  * 10 = 100 Elementen
    
    for(int i = 0; i < 5; i++){
      int x = r.nextInt(10);//Zufallszahl zwischen 0 und 9
      int y = r.nextInt(10);
      clickField(x, y);
    }
}


public void mousePressed(){
  button.mousePressed();
  //Umwandlung Mauskoordinaten in Feldkoordinaten
  int x = (mouseX - startX) / size;
  int y = (mouseY - startY) / size;
  clickField(x, y);
}



public void mouseReleased(){
  button.mouseReleased();
}

public void clickField(int x, int y){
  if(x >= 0 && x < 10 && y >= 0 && y < 10){
    for(int i = -1; i < 2; i++){
      for(int l = -1; l < 2; l++){
        //Mittleres Kaestchen hat die Koordinaten x und y
        //Kaestchen oben links hat die Koordinate x-1, y-1
        //Kaestchen unten rechts hat die Koordinate x+1, y+1
        flipColor(x + i, y + l);
      }
    }
    
    /*
    Alternative ohne Schleife:
    flipColor(x - 1, y - 1);
    flipColor(x - 1, y);
    flipColor(x - 1, y + 1);
    flipColor(x, y - 1);
    flipColor(x, y);
    flipColor(x, y + 1);
    flipColor(x + 1, y - 1);
    flipColor(x + 1, y);
    flipColor(x + 1, y + 1);
    */
  }
}

//invertiere ein Kaestchen
public void flipColor(int x, int y){
  //pruefe, ob Koordinate gueltig ist
  if(x >= 0 && x < 10 && y >= 0 && y < 10){
    field[x][y] = !field[x][y];// ! macht aus true -> false und aus false -> true
    
    /*
    if(field[x][y] == true){
      field[x][y] = false;
    }else{
      field[x][y] = true;
    }
    */
  }
  
  
}

public boolean isFinished(){
  //sind alle Felder schwarz (bzw. false)?
  for(int i = 0; i < field.length; i++){
      for(int l = 0; l < field[0].length; l++){
        if(field[i][l] == true){
          //Falls weisses Feld gefunden, gebe false zurueck
          return false;
        }
      }
  }
  //alle Felder muessen false sein --> gebe true zurueck
  return true;
}

public void draw(){
  background(200);
  button.draw();
  
  
  for(int i = 0; i < 10; i++){
    for(int l = 0; l < 10; l++){
        if(field[i][l]){
          //Licht an --> zeichne in weiss
          fill(255);
        }else{
          //Licht aus --> zeichne in schwarz
          fill(60);
        }
        if(isFinished()){
          //r, g, b
          fill(0, 255, 0);//gruen
        }
        
       rect(startX + i * size, startY + l * size, size, size);
    }
  }
      
}