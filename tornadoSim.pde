import peasy.*;

PeasyCam cam;
ArrayList<tornado> tor = new ArrayList<tornado>();

int rep = 0;

void setup(){
  //size(400,400,P3D);
  fullScreen(P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
  for(int i = 0; i < 1; i++){
    tor.add(new tornado());
  }
}
void draw(){
  background(0);
  stroke(120,255,255);
  fill(120,255,255);
  rect(-1000,-1000,2000,2000);
  for(int i = 0; i < tor.size(); i++){
    tor.get(i).update();
    tor.get(i).check();
    tor.get(i).show();
  }
  rep++;
  if(rep == 500){
    tor.add(new tornado());
    rep = 0;
  }
}