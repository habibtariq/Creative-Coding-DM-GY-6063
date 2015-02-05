void setup(){
  size(500,500);
}
void draw(){
  background(255);
  float  x, y;
  beginShape();
  for(int i=0;i<50; i = i + 1){
    x = random(500);
    y = random(500);
    vertex(x,y);    
  }
  endShape(CLOSE);
  delay(1000);

}
