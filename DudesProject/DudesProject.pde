Dude dude1, dude2;
PVector v1, v2;
PVector v1Velocity, v2Velocity;

void setup() {
  size(400, 400);
  v1 = new PVector(40, 20);
  v2 = new PVector(200, 200);
  v1Velocity = new PVector(2, 5);
  v2Velocity = new PVector(1.2, 5);
  background(51);

  dude1 = new Dude(v1.x, v1.y, 90, color(255, 255, 255), "rectangle", true);
  dude2 = new Dude(v2.x, v2.y, 50, color(255, 0, 0), "triangle", false);
}

void draw() {
  background(51);

  v1.add(v1Velocity);
  v2.add(v2Velocity);

  dude1.checkBoundaries(v1, v1Velocity, dude1.size);
  dude2.checkBoundaries(v2, v2Velocity, dude2.size);

  dude1.setPosition(v1.x, v1.y);
  dude2.setPosition(v2.x, v2.y);

  dude1.update();
  dude2.update();

  dude1.relationship(v1, v1Velocity, v2);
  dude2.relationship(v2, v2Velocity, v1);
}
