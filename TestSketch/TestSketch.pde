

void setup() {
  size(640, 640);
}

void draw() {
  background(0);

  int w = width;
  int h = height;

  fill(0, 255, 128);
  rect(0.25 * w, 0.33 * h, 0.5 * w, 0.33 * h);
  rect(0.1 * w, 0.1 * h, 0.25 * w, 0.35 * h);
}
