//Spinner class implementation maintaining the variables which in this case are floats 
public class Spinner
{ 
  float xpos; //xpos of the spinners (flying vehicle)
  float ypos; //ypos of the spinners (flying vehicle)
  float speedX; //speed of the spinner along the x-axis for the spinner (flying vehicle)

  // The Constructor is defined with parameters.  
  public Spinner(float xCoord, float yCoord, float tempXspeed) 
  { 
    xpos = xCoord; 
    ypos = yCoord;
    speedX = tempXspeed;
  }

//Spinner Display Function to display the spinner on the screen
  public void display() {
    stroke(50);
    fill(random(0, 200)); //fill the colour of the spinner at random as it is flying across the screen using the grayscale val between 0 and 200
    rectMode(CENTER);
    rect(xpos, ypos, 20, 10);
  }
  //Void move method for the spinner 
  public void move() {
    xpos = xpos + speedX;
    //If statement implementing if the xpos which drives the spinner is greater than the width then start again at the xpos of 0 and at a random location of the ypos stated below 
    if (xpos > width) {
      xpos = 0;
      ypos = random(45, 900);
    }
  }
}