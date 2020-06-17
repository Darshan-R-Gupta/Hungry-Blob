Blob b;
ArrayList<Blob> blobs;
float ini_rad = 100; 
void setup(){
  fullScreen();
  b = new Blob(0,0, ini_rad , color(255,0,0));
  blobs = new ArrayList<Blob>();
  for(int i =0 ; i < 100; ++i){
    Blob b1 = new Blob(random(-width, width), random(-height ,height) , random(10,30),color(255) );
    blobs.add(b1);
  }
}
void is_eating(){
   for(int i = 0; i < blobs.size(); ++i){
     Blob b1 = blobs.get(i);
     PVector dir = PVector.sub(b.loc, b1.loc);
     if(dir.mag() < (b.r+b1.r)/2  ){
       b.eat(b1);
       b1.loc = new PVector(random(-width, width), random(-height,height));
     }
   }
}
void draw(){
  background(0);
  translate(width/2, height/2); 
  if(b.r >ini_rad + 50){
    float scale_fact = (ini_rad + 50)/b.r;  
    scale_fact = lerp(1, scale_fact, 0.5);
    if(scale_fact < 0.1){
      scale_fact = 0.1;
    }
    scale(scale_fact);
  }
  translate(-b.loc.x, -b.loc.y);
  for(int i =0; i< blobs.size(); ++i){
    Blob b1 = blobs.get(i);
    b1.display();
  }
  is_eating();
  b.update();
  b.display();
}
