/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/154848*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/154727*@* */

/*----------------------------------
     
 Copyright by Diana Lange 2014
 Don't use without any permission. Creative Commons: Attribution Non-Commercial.
     
 mail: kontakt@diana-lange.de
 web: diana-lange.de
 facebook: https://www.facebook.com/DianaLangeDesign
 flickr: http://www.flickr.com/photos/dianalange/collections/
 tumblr: http://dianalange.tumblr.com/
 twitter: http://twitter.com/DianaOnTheRoad
 vimeo: https://vimeo.com/dianalange/videos
    
 -----------------------------------*/
 

JSONArray flickrData;
String filePath = "'processing.org'.json";


String [] names; // how many different authors are there in the data set
float [] [] rVals; // how many photos are linked to each author

float total = 0; // total number of photos 

float minVal, maxVal; // how is the least and highest number of photos per author
float minViews, maxViews; // how is the least and highest number of view per photo

PFont font;

boolean drawInfo = true;

void setup ()
{
  size (600, 600);
  smooth();

  loadJson();
  setData();

  font = createFont ("Arial", 14);
  textFont (font, 14);
  textAlign (LEFT, BASELINE);
}

void draw ()
{
  background (#57385c);

  if (mousePressed)
  {
    translate (-mouseX*3, -mouseY*3);
    scale (3);
  }

  drawChart ();
  if (drawInfo) drawText();
}

