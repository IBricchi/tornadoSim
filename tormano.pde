class tornado{
  float x;
  float ox;
  float cx;
  float y;
  float oy;
  float cy;
  float z;
  float a;
  
  float r = 2;
  float k = 1.01;
  
  float col;
  
  PVector[] tArr = new PVector[450];
  tornado(){
    a = random(0,360);
    col = random(0,255);
    ox = random(-1000,1000);
    oy = random(-1000,1000);
    z = 0;
  }
  void update(){
    cx += random(-50, 50);
    print(cx);
    cy += random(-50, 50);
    print(cy);
    x = ox + cx;
    y = oy + cy;
    z = 0;
    r = 2;
    for(int i = 0; i < tArr.length; i++){
      x += cos(a*i)*r*k;
      y += sin(a*i)*r*k;
      z ++;
      tArr[i] = new PVector(x,y,z);
      r = r*k;
    }
    a += 0.01;
  }
  void check(){
    for(int i = 0; i < tArr.length; i++){
      if(tArr[i].x > 1000){
        tArr[i].x -= 2000;
      }else if(tArr[i].x < -1000){
        tArr[i].x += 2000;
      }
      if(tArr[i].y > 1000){
        tArr[i].y -= 2000;
      }else if(tArr[i].y < -1000){
        tArr[i].y += 2000;
      }
    }
    if(cx > 1000){
      cx -= 2000;
    }else if(cx < -1000){
      cx += 2000;
    }
    if(cy > 1000){
      cy -= 2000;
    }else if(cy < -1000){
      cy += 2000;
    }
  }
  void show(){
    stroke(col, 255, 255);
    strokeWeight(5);
    noFill();
    beginShape();
    for(int i = 0; i < tArr.length; i++){
      point(tArr[i].x,tArr[i].y,tArr[i].z);
    }
    endShape();
  }
}