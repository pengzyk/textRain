// Ziyun Peng       ////////
// IACD P1_textRain /////////////
// 2013.01.24       /////////
/////////////////////////..................
//Reference: REBECCA GULOTTA's textrain.pde
////////////////////////...................

//////////////
import processing.video.*;
Capture webcam;

PImage tempImage;
int numOfLetters = 50;
Letter[] letters= new Letter[numOfLetters];
//////////////

void setup(){
  
  size(640,480);
  
  //test with an image
  //test();

  //turn on webcam
  webcam = new Capture(this, width, height, 30);
  //initialize the rain
  for (int i=0;i < numOfLetters; i++){
    letters[i] = new Letter();
  }
    
}

void randomDelay(){
  int d=int(random(0,100));
  int time = millis();
  while(millis()-time < d);
}

void draw(){
  //load test image
  //image(tempImage,0,0);
  
  //use camera
  webcam.read();
  image(webcam,0,0);
  
  // keep the camera running 
  //opencv.read()
  for(int i = 0; i < numOfLetters; i++){
    letters[i].update();
  }
}


void test(){
  //(or load a test image)
  tempImage = loadImage("Still-Participant.gif");
}


