
PShape model;

void setup() {
  fullScreen(P3D);
  model = loadShape("robot.obj");
}

void draw() {
  shape(model);
}