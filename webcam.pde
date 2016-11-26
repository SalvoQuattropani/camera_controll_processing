import processing.video.*;
import oscP5.*;
import netP5.*;
OscP5 oscP5;
int on_off=0;
Capture camera;


  void oscEvent(OscMessage theOscMessage) 
{
  String addr = theOscMessage.addrPattern();
  if(addr.indexOf("/on_off") !=-1)
    {                  
      on_off  = int(theOscMessage.get(0).floatValue());     
    }
 }


void setup(){
  oscP5 = new OscP5(this,3333);
 camera = new Capture(this, 320, 240, 30);
  
 size(400 ,300); 

}



void draw(){
  
  if(on_off!=0){
  camera.start();
 if(camera.available()){
  
camera.read();}
image(camera,0,0);
  } if(on_off==0){
  camera.stop();
}
  

}


