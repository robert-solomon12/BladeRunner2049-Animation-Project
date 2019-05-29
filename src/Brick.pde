public class Brick {   //defining the brick class and defining its different variables types
  private float xPos = 30;
  private float yPos = 50;
  private float diameter;
  //private int red, green, blue, gray;

  Brick(float xPos, float yPos, float diameter) //Brick constructor, return type
  {
    this.xPos = xPos;
    this.yPos = yPos;
    if ((diameter > 0) && (diameter < 500)) {
      this.diameter=diameter;
    } else {
      this.diameter = 30;
    }
  }//display this specific rectangle and encapsulating its different coordinates and diameter
  public void display()
  {
    stroke(0);    
    fill(180);
    rect(this.xPos, this.yPos, this.diameter, this.diameter);
  }
}