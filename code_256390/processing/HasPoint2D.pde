int[] pointX = new int[1000];
int[] pointY = new int[1000];
int max = 0;

void setup(){
  size(900, 900);
  background(255);

  drawPoints();
}

void draw() {

}

void drawPoints(){
  int x;
  int y = 60;
  noStroke();
  fill(5,111,255);
  for(int yy = 0 ; yy < 20 ; yy++){
    x = 70;
    for(int xx = 0 ; xx < 20 ; xx++){
      ellipse(x, y, 12, 12);
      x = x + 40;
    }
    y = y + 40;
  }
}

void mouseDragged(){
  if(max>=1000)return;
  
  stroke(0,255,0);
  strokeWeight(8);
  line(pmouseX, pmouseY, mouseX, mouseY);  
     
  pointX[max] = pmouseX;
  pointY[max] = pmouseY;
  max++; 
}

void mousePressed() {
  fill(255);
  noStroke();
  rect(0,0,900,900);
  drawPoints();  
  max = 0;
}

void mouseReleased() {
  line(pointX[0], pointY[0], mouseX, mouseY);   
  detect();
}

void detect(){
 
  int x;
  int y = 60;
  stroke(0);
  strokeWeight(1);
  fill(255,0,0);
  for(int yy = 0 ; yy < 20 ; yy++){
    x = 70;
    for(int xx = 0 ; xx < 20 ; xx++){
      if(HasPoint2D(x, y, pointX, pointY,max)==1){       
        ellipse(x, y, 12, 12);
      }
      x = x + 40;
    }
    y = y + 40;
  }  
}

int HasPoint2D(int targetX, int targetY, int[] pointX, int[] pointY, int max)
{
int cc,dd, r=0;

    for(cc=0,dd=max-1; cc<max;dd=cc++){
        if( ( ((pointY[cc]<=targetY) && (targetY<pointY[dd]))
           || ((pointY[dd]<=targetY) && (targetY<pointY[cc])) )
         && (targetX<(pointX[dd]-pointX[cc])*(targetY-pointY[cc])
            / (pointY[dd]-pointY[cc])+pointX[cc]) ){
            r=1-r;
        }
    }
    return r;
}
