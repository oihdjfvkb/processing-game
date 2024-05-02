class buff
{
  int Key;
  
  buff(int x,int y, int code) {
      Key=code;
      bf_pos[0+Key*3]=x;
      bf_pos[1+Key*3]=y;
      
}

  void record(){
    noStroke();
    if (Key==0){
      noFill();
      strokeWeight(3);
      stroke(#C372CE);
      ellipse(bf_pos[0+Key*3],bf_pos[1+Key*3],280,280);
      noStroke();
      fill(#D84C4C,100);
      ellipse(bf_pos[0+Key*3],bf_pos[1+Key*3],50,50);}

    else{
      noFill();
      strokeWeight(3);
      stroke(#C372CE);
      ellipse(bf_pos[0+Key*3],bf_pos[1+Key*3],280,280);
      noStroke();
      fill(#35AAD3,100);
      ellipse(bf_pos[0+Key*3],bf_pos[1+Key*3],50,50);
  }
    }
  void recover(){
    if (Key==0 && dist(bf_pos[0+Key*3],bf_pos[1+Key*3],player1.px,player1.py)<=150){
      strokeWeight(3);
      stroke(#C372CE);
      line(bf_pos[0+Key*3],bf_pos[1+Key*3],player1.px,player1.py);
      if  (player1.l<=40){
        if (player1.l<0)
          player1.l=0;
        player1.l+=0.165;
        textSize(12);
        fill(#34C6A8);
        text("+hp+", player1.px, player1.py+35); }
      if  (player1.l_mp<=30){
        if (player1.l_mp<0)
          player1.l_mp=0;
        player1.l_mp+=0.18;
        textSize(12);
        fill(#BE4CCB);
        text("+mp+", player1.px, player1.py+40); }
    }
    else if(Key==1   && dist(bf_pos[0+Key*3],bf_pos[1+Key*3],player2.px,player2.py)<=150){
      strokeWeight(3);
      stroke(#C372CE);
      line(bf_pos[0+Key*3],bf_pos[1+Key*3],player2.px,player2.py);
      if  (player2.l<=40){
        if (player2.l<0)
          player2.l=0;
        player2.l+=0.12;
        textSize(12);
        fill(#34C6A8);
        text("+hp+", player2.px, player2.py+35); }
      if  (player2.l_mp<=30){
        if (player2.l_mp<0)
          player2.l_mp=0;
        player2.l_mp+=0.21;
        textSize(12);
        fill(#BE4CCB);
        text("+mp+", player2.px, player2.py+40); }
    }
  
  }

}
