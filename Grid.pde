class Grid{
  int w,h;
  int[][] img;
  Grid(int w,int h){
    this.w=w;
    this.h=h;
    this.img = new int[h][w];
    for(int i = 0; i < h ; i ++){
      for(int j = 0 ; j < w ; j++){
        this.img[i][j]=0;
      }
    }
  }
  void diffuse(){
    for(int i = 1; i < h-1 ; i ++){
      for(int j = 1 ; j < w-1 ; j++){
        int a = this.img[i-1][j-1];
        int b = this.img[i][j-1];
        int c = this.img[i+1][j-1];
        int d = this.img[i-1][j];
        int e = this.img[i][j];
        int f = this.img[i+1][j];
        int g = this.img[i-1][j+1];
        int h = this.img[i][j+1];
        int k = this.img[i+1][j+1];
        
        this.img[i][j]= (a+b+c+d+e+f+g+h+k)/9;
        //this.img[i][j]= max(0,--this.img[i][j]);
      }
    }
  }
  void set_pixel(int x,int y, int val){
    if(x>=0&&y>=0&&x<width&&y<height){
      this.img[y][x]=val;
    }else{println(x+" "+y);}
  }
  int get_pixel(int x,int y){
    return this.img[y][x];
  }
  void render(){
    for(int i = 0; i < h ; i ++){
      for(int j = 0 ; j < w ; j++){
        noStroke();
        fill(this.img[i][j]);
        rect(j,i,2,2);
      }
    }
  }
}
