void setup(){
  size(500,500);
}
void draw(){
  background(255);
  int background_color = 200;
  
  fill(background_color);
  ellipse(375,200,10,10); //Point 1
  fill(background_color);
  ellipse(random(500),random(500),10,10); //Point 2
  fill(background_color);
  ellipse(50,100,10,10); //Point 3
  fill(background_color);
  ellipse(random(500),random(500),10,10); //Point 4
  fill(background_color);
  ellipse(random(500),random(500),10,10); //Point 5
  fill(background_color);
  ellipse(250,250,10,10); //Point 6
  fill(background_color);
  ellipse(122,345,10,10); //Point 7
  fill(0);
  ellipse(150,175,10,10); //Point 8

  float radius = dist(375,200,122,345);
  noFill();
  arc(375,200,radius, radius, 0 , PI);
  line(500,0,375,500);
  delay(1000);

}
