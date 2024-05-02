class ball{
  float bx,by,xo,yo;
  float speedx,speedy,angel,ang,d;
  
  ball(float x,float y,float x0,float y0){
    bx = x;
    by = y;
    xo=x0;
    yo=y0;
  }
  void display(){
    noStroke();
    angel=noise(bx*0.001,by*0.001);
    fill(255,random(0,90),0,255-2*dist(bx,by,xo,yo));
    speedx=cos(angel*4*PI)*3;
    speedy=sin(angel*4*PI)*3;
    bx+=speedx;
    by+=speedy;
    noStroke();
    triangle(bx-1,by-2,bx+3,by-4,bx+1,by+2);
    v[k][0]=bx;
    v[k][1]=by;
    if (bx<xo-120 || bx>xo+120 || by<yo-120 || by>yo+120){
      v[k][0]=-1;
    }   
  }
}
