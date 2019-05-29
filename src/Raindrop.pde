// Class called Raindrop maintaining the variable typr which is stated below.
class Raindrop {
  private float xCoord;
  private float yCoord;
  private float c;
  private float len;
  private float speedY;

  Raindrop() {  //Contructor giving the return type, therefore defining the variable above  
    xCoord  = random(width);   //Giving the raindrop a random x-cordinate to start with from the width (along the x-axis)
    yCoord  = random(-500, -50); //Giving the raindrop a random y-cordinate to start with from the top of the width of the screen (along the x-axis)
    c  = random(0, 20); //drop of rain that are far away mapping at 0 and 20 being close
    len = map(c, 0, 20, 10, 20); //Defining len a values to be mapped, mapping out c value to show the range between 0-20 to 1-20 to make it more realistic. (Illusion) 
    speedY  = map(c, 0, 20, 1, 20); //mapping the speedY value for c between 0 and 20 stating that 1px will be applied to the each drop that are far away and 20px that are close to apply for speedY
  }

  public void fall() {  //Function implementing the function of how the rain is going to fall 
    yCoord = yCoord + speedY;
    float grav = map(c, 0, 20, 0, 0.2); //speed of gravity mapping 0 - 20
    speedY = speedY + grav; //therefore my r

    //Implementing an if statement: If yCoord of the raindrop is greater than height then spawn a new location of raindrop at a random value in this case between -200 and -100
    if (yCoord > height) { 
      yCoord = random(-200, -100);
      speedY = map(c, 0, 20, 4, 10); //resetting the speedY according to the same mapping value so it will come back from top the exact same way
    }
  }

  public void display() {
    float thickness = map(c, 0, 20, 1, 3); //mapping out the size that it should be 1px wide when its further away and 3px when its close
    strokeWeight(thickness); 
    stroke(255, 0, 0); //Stroke weight colour being Red in this case
    line(xCoord, yCoord, xCoord, yCoord+len); //Co-ordinating the line being drawn after len is defined and mapped
  }

  public void reversed() {
    if (keyPressed) {
      println("Key is being pressed");
      if (key== 'r' || key== 'R') {
        //yCoord = random(600, 100);
        speedY = speedY * -1;
      }
    }
  }
}