import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;

import javax.swing.*;

String Description = "What you're seen here is my version of the falling rain with a lot of spacecrafts called Spinners flying across through the unstable weather along with Drones bouncing across inspired by a scene that caught my attention in the BladeRunner 2049 movie with a few adjustments as well as a bit of inspiration from one of my other deeply liked movies called Inception, enjoy!";         

Minim minim;
AudioPlayer sound; //variable name for the sound to be played

Drone d;
Spinner s;
Raindrop r;
Brick bk;

//Array Definitions for the following objects
Raindrop[] Raindrops = new Raindrop[500];
Spinner[] Spinners = new Spinner[30];
Brick[] Bricks = new Brick[17];



int i = 0; //variable for the use of while loop for the Bricks 

void setup()
{
  noCursor();
  fullScreen();
  //size(700, 700);
  println("Description: " + Description);


  //First Prompt to the user when the programm is run
  String greeting = JOptionPane.showInputDialog(
    "Hi and Welcome to my Animation!\n\n "
    + "Please Enter your Name (max 8 characters): ", " ");

  boolean k = true; //Boolean variable for k to be the true

  //while and if statement implementation for while the of characters is still exceeding 8 char of greetings, keep prompting user 
  while (k) {
    if (greeting.length() > 8) {
      greeting = JOptionPane.showInputDialog( 
        "Error, please Re-enter a valid amount of characters: ", " ");
    } else {
      k = false; //return false therefore prompting the user until length character is less than 8 char.
    }
  }

  //Second Prompt to the user when the accurate amount of characters is entered
  JOptionPane.showMessageDialog(null, 
    "It is nice to meet you " + greeting + " !");

  int reply = JOptionPane.showConfirmDialog(null, 
    "Let's continue, shall we?", 
    "Confirmation", 
    JOptionPane.YES_NO_OPTION);
  if (reply == JOptionPane.NO_OPTION) { //If the No-Option is chosen then exit the screen
    exit();
  }

  //defining music file to be played
  minim = new Minim(this);
  sound = minim.loadFile("The_Rain.mp3");
  sound.loop(); //looping the sound when it stops for as long as the sketch is run


  int b = 0;
  //while loop for the implementation of the array of bricks
  while (b < Bricks.length)
  {
    Bricks[b] = new Brick(50 +(b*200), 200, 50);
    b++;
  }


  //For loop implementation applying for every raindrop visible in the screen
  for (int i = 0; i < Raindrops.length; i++) {
    Raindrops[i] = new Raindrop();
  }

  //For loop implementation applying for every raindrop visible in the screen
  for (int i = 0; i < Spinners.length; i++) 
  { 
    Spinners[i] = new Spinner(0, random(height), random(6, 19));
  }

  d = new Drone(100); //Drone is set here
}




void draw() {
  background(201);

  //For loop implementation applying for every raindrop visible in the screen   
  for (int i = 0; i < Raindrops.length; i++) {  //for every i equals zero, as long as i is less than the length of the screen, incroment by one and implement the following function.
    Raindrops[i].fall();
    Raindrops[i].reversed();
    Raindrops[i].display();
  }

  //For loop implementation applying for every raindrop visible in the screen
  for (int i = 0; i < Spinners.length; i++) { //for every i ....
    Spinners[i].display();
    Spinners[i].move();
  }
  //Calling the update method for the Drone position
  d.update();
  d.display(); //displaying it by calling the display method in the drone class.

  int b = 0;
  while (b < Bricks.length)
  {
    Bricks[b].display();
    b++;
  }
}