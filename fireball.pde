class fireball
{
    float xend, yend,xo,yo;
    int w=30, h=30;
    int Key;
    float pos[];
    int t;//攻擊倍率和球速變數

   fireball(float xatt, float yatt, float xdef, float ydef, int code,int com) {
    pos = new float[6];
    if (code == 0) {
        
        fb_pos[0] = xatt;
        fb_pos[1] = yatt;
        fb_pos[2] = xdef;
        fb_pos[3] = ydef;
        pos = fb_pos; }
    else{
        fb_pos2[0] = xatt;
        fb_pos2[1] = yatt;
        fb_pos2[2] = xdef;
        fb_pos2[3] = ydef;
        pos = fb_pos2; }
    if (com>2)
        t=2;
    else
        t=com;

    Key = code;
    
}

    void shoot()
    {
      if ((Key==0 &&  player1.l_mp-6>=0)||(Key==1 &&  player2.l_mp-6>=0)){
      pos[4]=pos[0];
      pos[5]=pos[1];
      noStroke();
      if (t==0){
      fill(#C41492);
      ellipse(pos[0],pos[1],w,h);}
      else if (t==1){
      fill(#B9114F);
      ellipse(pos[0],pos[1],w+5,h+5);}
      else{
      fill(#B14CC1);
      ellipse(pos[0],pos[1],w+10,h+10);}
      
      hint[Key][1]=true;
      hint[Key][0]=false;
      if ( Key==0){
        fb_pos=pos;
        player1.l_mp-=12;
      }
      else{
        fb_pos2=pos;
        player2.l_mp-=9;
      }
        }
        
      else{
        if ( Key==0){
            textSize(16);
            fill(#E88502);
            text("not enough mpf", player1.px, player1.py+35);
        }
        else{
            textSize(16);
            fill(#E88502);
            text("not enough mp", player2.px, player2.py+35); 
        }
     }
    }
    void record(){
        if (dist(pos[0],pos[1],pos[4],pos[5]) <550+Key*100 && ((Key==0 && dist(pos[0],pos[1],player2.px,player2.py)>25+w/2)||(Key==1 && dist(pos[0],pos[1],player1.px,player1.py)>25+w/2)) &&400<pos[0]&& pos[0]<1000&& 100<pos[1]&& pos[1]<700) {
            pos[0] += ((pos[2]-pos[4])/(28-4*(t+Key*2+0.5)))/dist(pos[2],pos[3],pos[4],pos[5])*700;
            pos[1] += ((pos[3]-pos[5])/(28-4*(t+Key*2+0.5)))/dist(pos[2],pos[3],pos[4],pos[5])*700;
            noStroke();
            if (t==0){
              fill(#C41492);
              ellipse(pos[0],pos[1],w,h);}
            else if (t==1){
              fill(#B9114F);
              ellipse(pos[0],pos[1],w+5,h+5);}
            else{
              fill(#B14CC1);
              ellipse(pos[0],pos[1],w+10,h+10);}
        if ( Key==0){
          fb_pos=pos;}
          
        else {
          fb_pos2=pos;}
        }
        
        else{
        if(Key==1 && dist(pos[0],pos[1],player1.px,player1.py)<=25+w/2 ){
          t+=1;
          ball_m=millis();
          ball_hint=true;
          if(player1.l-(7+3.2*(t))>=0){
            player1.l-=(7+3.2*(t));
            combo2=t;
          }
          else{
            m=millis();
            player1.pcolor= #957979;
            player1.l=40;
            while(true){ 
            player1.px=400+int(random(0,10.0000001))*60+30;
            player1.py=100+int(random(0,10.0000001))*60+30;
            if (dist(player2.px,player2.py,player1.px,player1.py)>=210)
                break;
            }
            combo2=t;
            point[1]+=1;
          }
        }
         else if(dist(pos[0],pos[1],player2.px,player2.py)<=25+w/2 ){
          t+=1;
          ball_m2=millis();
          ball_hint2=true;
          if(player2.l-(16+2*(t))>=0){
            player2.l-=(16+2*(t));
            combo=t;
            
          }
          else{
            m=millis();
            player2.pcolor= #957979;
            player2.l=40;
            while(true){  
              player2.px=400+int(random(0,10.0000001))*60+30;
              player2.py=100+int(random(0,10.0000001))*60+30;
              if (dist(player2.px,player2.py,player1.px,player1.py)>=210)
                break;
            }
            combo=t;
            point[0]+=1;
          }
         }
        else{
          if( Key==0)
            combo=0;
          else if( Key==1)
            combo2=0;        
        }
         
        hint[Key][1]=false;
        hint[Key][0]=true;
        }
    }
  }
