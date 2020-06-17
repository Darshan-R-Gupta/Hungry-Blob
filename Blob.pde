class Blob{
  PVector loc;
  float r;
  color c;
  Blob(float x, float y, float r1, color c1){
    loc = new PVector(x,y);
    r = r1;
    c = c1;
  }
  void display(){
    noStroke();
    fill(c);
    ellipse(loc.x ,loc.y, r,r);
  }
  void eat(Blob b){
    if(r > 150){
      float sum = PI *r*r + PI * b.r*b.r;
      r = sqrt(sum/PI);
    }
    else{
      r+=b.r*0.2;
    }
  }
  void update(){
    PVector dir = new PVector(mouseX - width/2, mouseY - height/2 );
    dir.setMag(5);
    loc.add(dir);
  }
}
