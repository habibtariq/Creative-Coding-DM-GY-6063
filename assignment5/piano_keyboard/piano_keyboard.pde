import ddf.minim.*;
PianoKey[] pianoKeys = new PianoKey[12];
int ctr; // for storing highest index of pianoKeys index

int[] recordSound = new int[20];
int recordSize=0;
 
int previousNote = 0;
PFont myFont = createFont("Arial", 14);
PFont myFont2 = createFont("Arial", 12);

boolean record = false;
String dispInterval="";
 
PImage keyboard;
 
Minim minim;
AudioPlayer song;
 
class PianoKey {
  int n_x1; // top left corner of bounding rectange of key
  int n_y1;
  int n_x2; // bottom right corner of bounding rectangle of key
  int n_y2;
  int midiNoteNum;  //  MIDI Note number - used to calculate intervals
  String noteName;   // Name of Note,  eg  C,  F#/G&
  String soundFile;  // name of file to play when this note played
  char letter;     // used for playing notes from the computer keyboard
   
  PianoKey(int x1, int y1, int x2, int y2, int note, String name, String wavefile, char keyletter) {
        n_x1 = x1;
        n_y1 = y1;
        n_x2 = x2;
        n_y2 = y2;
        midiNoteNum = note;
        noteName = name;
        soundFile = wavefile;
        letter = keyletter;
  }
   
  void drawRect() {
   rect(n_x1, n_y1, n_x2 - n_x1, n_y2 - n_y1);
  }
   
  void playNote() {
    // black out the note name displayed previously
    fill(0);
    noStroke();
    rect(0, 500, width, 30);
     
    // Draw a semi transparent rectange on the note when played
    fill(250,150, 150,90);
    noStroke();
    drawRect();
     
    // play the sound file (MP3 file in the Data sub directory)
    song = minim.loadFile(soundFile);
    song.play();
     
    // Display the note name below the note pressed
    stroke(255);
    fill(250, 222, 5);
    textFont(myFont);
    text(noteName, n_x1, 520);
     
    // display the interval
    if (previousNote == 0) {
      previousNote = midiNoteNum;  // first time
      return;
    }
    int interval = midiNoteNum - previousNote;
    dispInterval =dispInterval+"(" + noteName +"), ";

//    String dispInterval = calcInterval(previousNote, midiNoteNum) + "    " +
//             str(abs(midiNoteNum - previousNote)) + " semitones";
    previousNote = midiNoteNum;
    // black out the note name displayed previously
    fill(0);
    noStroke();
    rect(0, 257, 300, 100);
    textFont(myFont2);
    fill(55,160,35);  // green
    text(dispInterval, 30, 300);
  }
   
  boolean inside(int mx, int my) {
    // returns true if the point (mx,my) is inside the bounding rectangle of this object
    if ((mx < n_x1) || (mx > n_x2)) {
      return false;
    }
    if ((my > n_y2) || (my < n_y1)) {
      return false;
    }
    return true;
  }
}

void mousePressed() {
   // Following line was used to measure coordinates of piano keys to update setup() function
    println(mouseX + "," + mouseY);
   for (int i = 0; i <= ctr; i++) {
   if (pianoKeys[i].inside(mouseX, mouseY) ) {
     pianoKeys[i].playNote();
     recordSound[recordSize]=i;
     recordSize++;
   }
 }
}
 
void keyPressed() {
   for (int i = 0; i <= ctr; i++) {
   if (pianoKeys[i].letter == key)  {
     pianoKeys[i].playNote();
     image(keyboard, 0, 0);
   }
 }
 if(key == 'r'){
 record =!record;
 if(record){
 dispInterval="";
 recordSize=0;
 }
 }
 if(key == 'p'){
 for(int i=0;i<recordSize;i++){
 pianoKeys[i].playNote();
 delay(1000);
 }
 }
 
}
   
void mouseReleased() {
 image(keyboard, 0, 0);
}
 
void draw() {
 // needed to active mouse and key events 380 20
 if(record){
 fill(255,0,0);
 ellipse(380,20,10,10);}
 else {
 fill(0,0,0);
 ellipse(380,20,10,10);}

 

}
 
void setup() {
  keyboard = loadImage("PianoKeyboard.png");
  size(keyboard.width,keyboard.height + 100);
  background(0);
  image(keyboard, 0, 0);
  minim = new Minim(this);

  pianoKeys[0] = new PianoKey(14, 157, 62, 240, 48, "C", "c.wav", 'a');
  pianoKeys[1] = new PianoKey(47, 8, 80, 155, 49, "C# Df", "c#.wav", 'w');
  pianoKeys[2] = new PianoKey(63, 157, 111, 240, 50, "D", "d.wav", 's');
  pianoKeys[3] = new PianoKey(95, 8, 130, 155, 51, "D# Ef+", "eb.wav", 'e');
  pianoKeys[4] = new PianoKey(114, 157, 161, 240, 52, "E", "e.wav", 'd');
  
  pianoKeys[5] = new PianoKey(163, 157, 212, 240, 53, "F", "f.wav", 'f');
  pianoKeys[6] = new PianoKey(192, 8, 227, 155, 54, "F# Gf", "f#.wav", 't'); 
  pianoKeys[7] = new PianoKey(213, 157, 262, 240, 55, "G", "g.wav", 'g');
  pianoKeys[8] = new PianoKey(242, 8, 276, 155, 56, "G# Af", "g#.wav", 'y');
  pianoKeys[9] = new PianoKey(263, 157, 312, 240, 57, "A", "a.wav", 'h');
  pianoKeys[10] = new PianoKey(290, 8, 324, 155, 58, "A# Bf", "bb.wav", 'u');
  pianoKeys[11] = new PianoKey(313, 157, 362, 240, 59, "B", "b.wav", 'j');
  
  ctr = 11;
  frameRate(6);
}

