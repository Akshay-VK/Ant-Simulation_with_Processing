class Agent{
  PVector p,prev;
  float dir, rand_str;
  Agent(int x, int y, float dir, float rand_strength){
    this.p=new PVector(x,y);
    this.dir=dir;
    this.rand_str=rand_strength;
  }
  void step(Grid gr){
    prev=p;
    float dx=cos(dir),dy=sin(dir);
    p.x+=dx*rand_str;
    p.y+=dy*rand_str;
    dir += noise(p.x/100.0,p.y/100.0)*2-1;
    int sec=5;
    //if(p.x<sec||p.x>width-sec||p.y<sec||p.y>height-sec){
    //  p.x=(int)(random(5,width-5));
    //  p.y=(int)(random(5,height-5));
    //}
    if(p.x>width-5)p.x=5;
    if(p.x<5)p.x=width-5;
    if(p.y>height-5)p.y=5;
    if(p.y<5)p.y=height-5;
    
    int[] n = new int[8];
    n[2]=gr.get_pixel((int)p.x,(int)p.y-1);
    n[0]=gr.get_pixel((int)p.x+1,(int)p.y);
    n[6]=gr.get_pixel((int)p.x,(int)p.y+1);
    n[4]=gr.get_pixel((int)p.x-1,(int)p.y);
    n[1]=gr.get_pixel((int)p.x+1,(int)p.y-1);
    n[3]=gr.get_pixel((int)p.x-1,(int)p.y-1);
    n[7]=gr.get_pixel((int)p.x+1,(int)p.y+1);
    n[5]=gr.get_pixel((int)p.x-1,(int)p.y+1);
    int max=0;
    double in=50;
    for(int i = 0; i < 8; i++){
      if(n[i]>max){
        max=n[i];
        in=i;
      }
    }
    in /=8.0;
    if(in>dir)dir-=0.01;
    else if(in<dir)dir+=0.01;
    else dir = dir+0;
  }
}
