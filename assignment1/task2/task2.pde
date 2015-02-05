void setup(){
  size(500,500);
}
void draw(){
  background(255);
  float x1,y1,x2,y2,x3,y3,x4,y4,x5,y5,x6,y6,x7,y7;
  x1=random(500);
  y1=random(500);
  x2=random(500);
  y2=random(500);
  x7=random(500);
  y7=random(500);
  
  float radius= dist(x1,y1,x7,y7);
  arc(x1,y1,radius, radius, 0 , TWO_PI);
  line(x1,y1,x2,y2);
  line(random(375,500),random(375,500),375,random(0,250));
//  arc(250, 250, 200, 200, 0, PI);
  delay(1000);

}
