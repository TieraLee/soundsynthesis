import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;
import beads.SamplePlayer.LoopType;

//declare global variables at the top of your sketch
//AudioContext ac; is declared in helper_functions

ControlP5 p5;
SamplePlayer alertHigh;
SamplePlayer alertMed;
SamplePlayer alertLow;

SamplePlayer ambientHigh;
SamplePlayer ambientMed;
SamplePlayer ambientLow;



//end global variables

//runs once when the Play button above is pressed
void setup() {
  size(400, 400); //size(width, height) must be the first line in setup()
  ac = new AudioContext(); //AudioContext ac; is declared in helper_functions
  
  alertHigh = getSamplePlayer("High Alert.wav");
  alertHigh.pause(true);
  alertMed = getSamplePlayer("Medium Alert.wav");
  alertMed.pause(true);
  alertLow = getSamplePlayer("Low Alert 2.wav");
  alertLow.pause(true);
  
  ambientHigh = getSamplePlayer("High Ambient.wav");
  ambientHigh.pause(true);
  ambientHigh.setLoopType(LoopType.LOOP_FORWARDS);
  ambientMed = getSamplePlayer("Medium Ambient.wav");
  ambientMed.pause(true);
  ambientMed.setLoopType(LoopType.LOOP_FORWARDS);
  ambientLow = getSamplePlayer("Low Ambient.wav");
  ambientLow.pause(true);
  ambientLow.setLoopType(LoopType.LOOP_FORWARDS);
  
  
  p5 = new ControlP5(this);
  p5.addButton("ambient_Low")
  .setPosition(100,125)
  .setSize(60,60);
  
  p5.addButton("ambient_Med")
  .setPosition(175,125)
  .setSize(60,60);
  
  p5.addButton("ambient_High")
  .setPosition(250,125)
  .setSize(60,60);
  
  p5.addButton("alert_Low")
  .setPosition(100,225)
  .setSize(60,60);
  
  p5.addButton("alert_Med")
  .setPosition(175,225)
  .setSize(60,60);
  
   p5.addButton("alert_High")
  .setPosition(250,225)
  .setSize(60,60);
  
  
  ac.out.addInput(alertLow);
  ac.out.addInput(alertHigh);
  ac.out.addInput(alertMed);
  ac.out.addInput(ambientLow);
  ac.out.addInput(ambientMed);
  ac.out.addInput(ambientHigh);
  ac.start();
                  
}


void draw() {
  background(0);  //fills the canvas with black (0) each frame
  rect(50,100, 300, 200,7);
  
}

void alert_Low() {
  alertLow.setToLoopStart();
  alertHigh.pause(true);
  alertMed.pause(true);
  alertLow.start();
}

void alert_Med() {
  alertMed.setToLoopStart();
  alertLow.pause(true);
  alertHigh.pause(true);
  alertMed.start();
}

void alert_High() {
  alertHigh.setToLoopStart();
  alertLow.pause(true);
  alertMed.pause(true);
  alertHigh.start();
}

void ambient_Low() {
  ambientLow.setToLoopStart();
  ambientHigh.pause(true);
  ambientMed.pause(true);
  ambientLow.start();
}

void ambient_Med() {
  ambientMed.setToLoopStart();
  ambientLow.pause(true);
  ambientHigh.pause(true);
  ambientMed.start();
}

void ambient_High() {
  ambientHigh.setToLoopStart();
  ambientLow.pause(true);
  ambientMed.pause(true);
  ambientHigh.start();
}