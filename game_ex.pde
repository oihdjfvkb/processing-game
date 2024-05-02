//紅色player1 生命值高 攻擊力高 但子彈射速慢，射程較短  
//藍色player2 子彈射速快 射程長 但攻擊力和生命值略低


int x=400,y=150;
////////////////////////////
int a[];//加速或減速
int C[];
///////////////////////////
int b[][];
int index;
float fb_pos[],fb_pos2[];
int bf_pos[];
int sflg;
///////連續擊中次數(攻擊倍率)
int combo=0,combo2=0;
int point[];
///////原本的生命值
int h1,h2;

float coin,texttime;
PVector vw,va,vs,vd;
char shoot_fb='f',shoot_fb2=';';
boolean hint[][];
boolean time_hint=true;
boolean ball_hint=false,ball_hint2=false;


//////ball
float v[][];
int k;
int ball_m,ball_m2;
ball c;



Button startb,restartb,pauseb;
Player player1,player2;
buff bf; 
////
fireball fb;
///////////////////紀錄變灰時間
int m;

///////////////////Map
float a1=-1;
float Map[][];


void setup(){
  fullScreen();

  ////////////////////UI set//////////////////////////
  startb = new Button(100,150,200,100,"START",60,209,105,119);
  

  
  b = new int[10][10];
  for(int i=0;i<=9;i+=1){
    for(int j=0;j<=9;j+=1){
      b[i][j] = 0;
    }
  }
  //////////////Map set
  Map=new float [100][100];
  for (int i = 0; i < 100; i++) {
    for (int j = 0; j < 100; j++) {
      int a2=int(noise(0.02*i,0.02*j)*20)*26;
      if ( a1!=a2)
        Map[i][j]=0;
        else
          Map[i][j]=a2;
      a1=a2;
    }
  }
  

  ///////////////////character set/////////////////////
  player1 = new Player(430,130,#F04B51);
  player2 = new Player(970,670,#52B4F0);
  vw = new PVector(0,-1);
  vs = new PVector(0,1);
  va = new PVector(-1,0);
  vd = new PVector(1,0);
  //////////////////火球位置紀錄
  fb_pos = new float[6];
  fb_pos2 = new float[6];
  hint = new boolean[2][10];
  hint[0][0]=true;
  hint[0][1]=false;
  hint[0][2]=false;
  hint[1][0]=true;
  hint[1][1]=false;
  hint[1][2]=false;
  ///////////////////buff位置和存在紀錄  
  bf_pos = new int[6];
  ///////////////////紀錄分數
  point= new int [2]; 
  
  
  ////////////////////ball set
    size(800,600); 
  v =new float[8000][2];

}
void draw(){
  scale(1.4);
  background(200,30);
  startb.render();
  //////////////////////////map  
colorMode(RGB, 400);
for (int i = 0; i < 100; i++) {
  for (int j = 0; j < 100; j++) {
    stroke(Map[i][j]); 
    fill(Map[i][j]);
    rect(400+i*6,100+j*6,6.5,6.5);
  }
}
  colorMode(RGB, 255);
 
   ///////////////////////////////ball
if (ball_hint && millis()-ball_m<=700){
  for (k=0;k<40;k++){
    //print(v[k][0]);
    if (v[k][0] == -1.0){    
      v[k][0]=player1.px+random(-15,15);
      v[k][1]=player1.py+random(-15,15);
    }
    c=new ball(v[k][0],v[k][1],player1.px,player1.py);
    c.display();
  }
 }
 if (ball_hint2 && millis()-ball_m2<=700){
  for (k=40;k<80;k++){
    //print(v[k][0]);
    if (v[k][0] == -1.0){    
      v[k][0]=player2.px+random(-15,15);
      v[k][1]=player2.py+random(-15,15);
    }
    c=new ball(v[k][0],v[k][1],player2.px,player2.py);
    c.display();
  }
 }
  
    ///////////////////////////////////////buff set////////////////

if (key == 'c' && bf_pos[0]!=player1.px && bf_pos[1]!=player1.py){
  if (player1.l_mp-25>0){    
      bf_pos[0]=player1.px;
      bf_pos[1]=player1.py;
      bf_pos[2]=1;
      player1.l_mp-=25;
      hint[0][2]=true;}
   else{
      textSize(16);
      fill(#E88502);
      text("not enough mp", player1.px, player1.py+35);}
 }
 else if (key == '.' && bf_pos[3]!=player2.px && bf_pos[4]!=player2.py ){
    if (player2.l_mp-25>0){    
        bf_pos[3]=player2.px;
        bf_pos[4]=player2.py;
        bf_pos[5]=1;
        player2.l_mp-=25;
        hint[1][2]=true;}
    else{
      textSize(16);
      fill(#E88502);
      text("not enough mp", player2.px, player2.py+35); 
    }
    
 }
  if (hint[0][2]){
    bf= new buff(bf_pos[0],bf_pos[1],0);
    bf.record();
    bf.recover();
  }
  if (hint[1][2]){
    bf= new buff(bf_pos[3],bf_pos[4],1);
    bf.record();
    bf.recover();
  }
  
  //////////////////////hp mp 自動回復////////////
    if (player1.l<0)
      player1.l=0;
    if (player1.l_mp<0)
      player1.l_mp=0;
    if (player2.l<0)
      player2.l=0;
    if (player2.l_mp<0)
      player2.l_mp=0;
    if (player1.l<40)
      player1.l+=0.16;
    if (player1.l_mp<30)
      player1.l_mp+=0.25;
    if (player2.l<40)
      player2.l+=0.1;
    if (player2.l_mp<30)
      player2.l_mp+=0.38;
      
    ////////////////fireball(player1的) fireball2(player2的) set /////////////////////////
  
  //// hint1 hint2 (不可刪會當機)
  ////fireball  玩家一按 "f" 射火球

  if (key == 'f')
      index=0;
  else if (key == ';')
      index=1;
  if ((keyPressed && (key == 'f'|| key == ';')))
  {
    if (hint[index][0]){
      if (index==0 ){
        fb= new fireball(player1.px,player1.py,player2.px,player2.py,index,combo);
        fb.shoot();
      }
      else if (index==1 ){
        fb= new fireball(player2.px,player2.py,player1.px,player1.py,index,combo2);
        fb.shoot();
      }
    
    
    fb.record();
  }
  }

  /////////////////////After Started//////////////////////////
  if(sflg == 1){
    if(player1.nextTurn() && player2.nextTurn()){
      player1.castReset();
      player2.castReset();
    }
    
  /////////////////////每2秒 cast回復/////////////////////////
    
    if(time_hint){
      player1.castReset();
      player2.castReset(); 
      time_hint=false;
    } 
    else if (millis()%8==0){
      time_hint=true;
    }
    
  /////////////////////////////////////////////////////////////
  
    player1.render();
    player2.render();

  }
  
  ////////////////////////////////////DEFEAT
  if(player1.pcolor != #F04B51 && millis()-m >= 750)
    player1.pcolor = #F04B51;
  else if(player1.pcolor !=#F04B51){
    textSize(25);
    fill(#895454);
    text("DEFEAT", player1.px, player1.py);
    rectMode(CENTER);
    noStroke();
    fill(#895454,random(80,180));
    rect(player1.px+random(-12,12),player1.py+random(-10,15),random(40,60),random(1,8));
    fill(#52B4F0,random(100,200));
    rect(253,330+random(-30,30),80,random(5,20));
    rectMode(CORNER);
  }
  if(player2.pcolor !=#52B4F0 && millis()-m >=750)
    player2.pcolor= #52B4F0;
  else if(player2.pcolor !=#52B4F0){
    textSize(25);
    fill(#895454);
    text("DEFEAT", player2.px, player2.py); 
    rectMode(CENTER);
    noStroke();
    fill(#895454,random(80,180));
    rect(player2.px+random(-12,12),player2.py+random(-10,15),random(40,60),random(1,8));
    fill(#F04B51,random(100,200));
    rect(138,330+random(-30,30),80,random(5,20));
    rectMode(CORNER);
  }
    
  
  
  
  
  
  ///////////////display start///////////////////////////
  if(texttime<30){
    if(sflg == 1){
      fill(#F04B51);
      textSize(100-texttime/2);
      textAlign(CENTER,CENTER);
      text("GAME STARTED",700,400);
      player1.Valid(true);
      player2.Valid(true);
      texttime+=1;
    }
  }
  


for(int i=0;i<2;i+=1){  
  if (hint[i][1]){
    if (i==0)
      fb= new fireball(fb_pos[0],fb_pos[1],fb_pos[2],fb_pos[3],i,combo);
    else{
      fb= new fireball(fb_pos2[0],fb_pos2[1],fb_pos2[2],fb_pos2[3],i,combo2);}
    fb.record();
   } 
 }

 
 ///////////////////////////////比數
 fill(#F04B51);
 textSize(100);
 text(point[0],138,330 ); 
 fill(255);
 text(":",193,321); 
 fill(#52B4F0);
 text(point[1],253,330);

}

void mousePressed()  {
  if(startb.isMouseOver()){
    player1.display();
    player2.display();
    startb.isValid(false);
    sflg = 1;
  }


}
void keyPressed(){
  /////////////////////players function/////////////////
  if(player1.isActivated() && player2.isActivated()){
    player1.move('w',vw);
    player1.move('a',va);
    player1.move('s',vs);
    player1.move('d',vd);
    
    
    player2.move('i',vw);
    player2.move('j',va);
    player2.move('k',vs);
    player2.move('l',vd);   
  }
  
}
