Manager m;

void setup(){
  size(960,540);
  m = new Manager();
  background(255);
  
}
void draw(){
  m.update();
  m.render();
  //if(keyPressed){
  //  if(key=='s'||key=='S'){
  //    saveFrame("ant-sim6-######.png");
  //  }
  //}
  saveFrame("render3/frame-######.png");
}
