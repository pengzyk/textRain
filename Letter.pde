

char[] alphabets = {
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 
  'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 
  'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 
  'y', 'z'
};

color c=#505050; //some gray..
float bThreshold=60.0; //brightness threshold

class Letter{
  //color c;
  int xpos;
  int ypos;
  int speed;
  //randomly generate a letter from the alphabets list
  int  letterIndex=int (random(0,alphabets.length));
  char letter=alphabets[letterIndex];

  Letter() {

    xpos=int(random(0, width));
    ypos=0;
    speed=1;
  }
  
  void update(){
    letterMove();
    display();
    
  }
  
  void letterMove(){
    
    //go back to top if reaches the bottom
    if(ypos>=height){
      ypos=0;
      xpos=int(random(0, width));
    }
    
    //get image pixels
    loadPixels();
    int pIndex=ypos*width+xpos;
    color pixel=pixels[pIndex];
    //check dark pixel
    if(ypos<height && !isDark(pixel)){
     ypos+=speed;//keep falling
    }
    
  }
  
  boolean isDark(color pixel){
    
    float pixelBrightness=brightness(pixel);//get brightness value
    
    if (pixelBrightness > bThreshold) {
      //keep falling
      return false;
    }
    else{
      //stop
      return true;
    }   
  }

  void display() {
    //draw the letter to the canvas
    fill(c);
    text(letter,xpos,ypos);
    textSize(18);  
  }
}
