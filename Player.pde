class Player{
  int px,py;
  PVector pv;
  color pcolor;
  int pm;
  int cast=4;
  float ang;
  Boolean Activated = false;
  Boolean valid = false;
  float l=40,l_mp=30;
  //血量差
  float blo=0;
  Player(int x,int y,color c){
    px = x;
    py = y;
    pcolor = c;
  }
  void display(){
    noFill();
    stroke(pcolor);
    strokeWeight(3);
    arc(px,py,20,20,PI/4+ang, PI*3/4+ang);
    point(px,py);
    strokeWeight(2); 
    ellipse(px,py,30,30);
    Activated = true;
  }
  void move(int m,PVector v)//use in draw
  {
    pm = m;
    pv = v;
    if(valid){
      if (keyPressed){
        if (key == pm){
          if((px + 60*pv.x>400) && (px + 60*pv.x<1000) && (py + 60*pv.y>100) && (py + 60*pv.y<700) && cast!=0)
          {
             px += 60 * pv.x;
             py += 60 * pv.y;
             if (pv.x!=0){
               ang = -asin(pv.x);
             }
             if (pv.y!=0){
               ang = -acos(pv.y);
             }
             cast -= 1;
          }
          else if(cast == 0){
            
          }
        }
      }
    }
  }

  void render()//use in draw()
  {
    
    fill(255);
    stroke(pcolor);
    strokeWeight(2);   
    ellipse(px,py,30,30);
    strokeWeight(3);
    noFill();    
    arc(px,py,20,20,PI/4+ang, PI*3/4+ang);
    point(px,py);
    rect(px-15,py+19,l*3/4,1);
    noFill();
    stroke(0);
    strokeWeight(0.1);
    rect(px-15,py+19,30,1);
    strokeWeight(1.5); 
    stroke(#82598E);
    fill(#82598E);
    rect(px-15,py+24,l_mp,1);
    noFill();
    stroke(0);
    strokeWeight(0.1);
    rect(px-15,py+24,30,1);
    textSize(22);
    fill(#E88502);
    text("cast="+str(cast),px,py-25,255);
    fill(255);
    text("cast="+str(cast),px,py-22.5,255);
  }
  void castReset(){
    cast = 4;
  }
  boolean nextTurn(){
    if(cast == 0){
      return true;
    }
    return false;
  }
  boolean isActivated()//use in if() to check
  {
    return Activated;
  }
  boolean Valid(boolean x)//use in if() to check
  {
    return valid = x;
  }
}
