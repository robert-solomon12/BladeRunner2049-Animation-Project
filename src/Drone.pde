//Class called Drone maintaining the variable type stated below
public class Drone
{
  private float xCoord;     //x coordinate of the Drone
  private float yCoord;     //y coordinate of the Drone
  private float diameter;   //diameter of the Drone
  private float speedX = 3.0;     //speed along the x-axis
  private float speedY = 5.0;     //speed along the y-axis

  //Constructor to set up the Drone and its diameter
  public Drone(float diameter)
  {
    setDiameter(diameter);
  }

  //Change Drone position. Returns true if the Drone goes off the screen (i.e. life lost)
  public void update()
  {
    //update Drone coordinates to its initial speeds
    xCoord = xCoord + speedX;
    yCoord = yCoord + speedY;


    //If Drone hits the top or bottom of the display window, change direction of yCoord
    if (yCoord > height) {
      speedY = -speedY;
    }

    //If Drone hits the left edge of the display window, change direction of xCoord
    if (xCoord < diameter/2) {
      xCoord = diameter/2;
      speedX = speedX   * -1;
    } else if (yCoord < diameter/2) {
      yCoord = diameter/2;
      speedY = -speedY;
    }

    //reset position if the Drone leaves the screen from the xCoord positively
    if (xCoord > width - diameter/2) {
      //xCoord = height - diameter/2;
      speedX = -speedX;
      resetDrone();
    }
  }

  //Draw the Drone on the display window
  public void display()
  {
    fill(80);
    stroke(0);
    ellipse(xCoord, yCoord, diameter, diameter);
  }    

  //getter methods
  public float getYCoord()
  {  
    return yCoord;
  }  

  public float getXCoord()
  {
    return xCoord;
  }  

  public float getDiameter()
  {
    return diameter;
  }  

  //setter methods
  public void setDiameter(float diameter)
  {
    //The Drone diameter must be between 50 and 100 (inclusive)
    if ((diameter >= 50) && (diameter <= 100)) {
      this.diameter = diameter;
    } else {
      // If an invalid diameter is passed as a parameter, a default of 30 is imposed.
      this.diameter = 30;
    }
  }

  //private helper method
  private void resetDrone()
  {
    xCoord = 1;
    yCoord = 1;
    speedX = -speedX;
  }
}