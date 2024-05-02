class Button{
  PVector Pos = new PVector(0,0);
  float Width = 0;
  float Height = 0;
  color Color;
  String Text;
  int textSize;
  Boolean Valid = true;
  int bcolor = 255;

  Button(int x,int y,int w,int h, String t,int ts,int r, int g, int b){
    Pos.x = x;
    Pos.y = y;
    Width = w;
    Height = h;
    Color = color(r,g,b);
    Text = t;
    textSize = ts;
  }
  boolean isMouseOver(){
    if(mouseX >= Pos.x*1.4 && mouseX <= Pos.x*1.4 + Width*1.4 && mouseY >= Pos.y*1.4 && mouseY <= Pos.y*1.4 + Height*1.4){
      return  true;
    }
    return false;
  }
  void render()//use in draw() 
  {
    if(Valid){
      fill(bcolor);
      stroke(Color);
      strokeWeight(5);
      rect(Pos.x,Pos.y,Width,Height);
      
      fill(Color);
      textSize(textSize);
      textAlign(CENTER,CENTER);
      text(Text,Pos.x+(Width/2),Pos.y+(Height/2));
    }
  }
  Boolean isValid(Boolean x){
    return Valid = x;
  }
}
