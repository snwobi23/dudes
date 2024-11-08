public class Dude {
  private float x, y;
  private float size = 40;
  private color col;
  private color originalColor;
  private String shape = "circle";
  private boolean loveOther;


  public Dude(float x, float y, float size, color col, String shape, boolean loveOther) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.col = col;
    this.originalColor = col;
    this.shape = shape;
    this.loveOther = loveOther;
  }

  public void update () {
    face();
  }

  private void face() {
    fill(col);
    noStroke();
    checkShape();
  }

  public void setPosition(float newX, float newY) {
    this.x = newX;
    this.y = newY;
  }

  private void checkShape() {
    if (shape.equals("circle")) {
      ellipse (x, y, size, size);
    } else if (shape.equals("triangle")) {
      triangle(x, y - size / 2, x - size / 2, y + size / 2, x + size / 2, y + size / 2);
    } else if (shape.equals("rectangle")) {
      rect(x, y, size, size);
    } else if (shape.equals("polygon")) {
      quad(x, y - 10, size, y - 20, size - 10, y - 30, size - 20, y - 40);
    } else if (shape.equals("square")) {
      square(x, y, size);
    }
  }

  public void relationship(PVector pos1, PVector velocity1, PVector pos2) {
    float directionX = pos2.x - pos1.x;
    float directionY = pos2.y - pos1.y;
    PVector direction = new PVector(directionX, directionY);

    float distance = direction.mag();

    changeColor(distance);

    if (distance > 5) {
      direction.div(distance);

      if (loveOther) {
        velocity1.add(direction.mult(0.2)); //dude chases other dude
      } else {
        velocity1.sub(direction.mult(0.2)); //dude repels other dude
      }
    }
  }
  // makes sure the dude doesn't go out of bounds
  public void checkBoundaries(PVector pos, PVector velocity, float objSize) {
    float halfSize = objSize/ 2;

    if (pos.x  - halfSize <= 0 ) {
      pos.x = halfSize;
      velocity.x *= -1; // makes the dude go backwards
    } else if  (pos.x + halfSize >= width) {
      pos.x = width - halfSize;
      velocity.x *= -1;
    }

    if (pos.y  - halfSize <= 0 ) {
      pos.y = halfSize;
      velocity.y *= -1;
    } else if (pos.y + halfSize >= height) {
      pos.y = height - halfSize;
      velocity.y *= -1;
    }
  }

  public void changeColor(float distances) {

    if (distances < 2) {
      col = color(0, 255, 0); // Changes to green if their too close
    } else {
      col = originalColor;// Reset to original color
    }
  }
}
