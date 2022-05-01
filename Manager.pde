class Manager{
  Agent[] agents;
  int num_agents;
  Grid grid;
  Manager(){
    num_agents=2000;
    this.agents=new Agent[num_agents];
    for(int i =0;i<num_agents;i++){
      float ang = random(0,360), mag = random(0,100);
      this.agents[i]=new Agent(width/2+(int)(cos(ang)*mag),height/2+(int)(sin(ang)*mag),(float)-ang/360,2);
    }
    this.grid = new Grid(width,height);
  }
  void update(){
    for(int i =0;i<num_agents;i++){
      agents[i].step(this.grid);
      grid.set_pixel((int)agents[i].p.x,(int)agents[i].p.y,255);
    }
    grid.diffuse();
  }
  void render(){
    this.grid.render();
  }
}
