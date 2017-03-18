
// LEDs
OPC opc;

float dotSize = 150;

void setup() {
  size(640, 360, P2D);

  // Initialize the LED connection and positions
  initLEDs();
}

void initLEDs() {
  // connect to the running fcserver process on your computer
  opc = new OPC(this, "127.0.0.1", 7890);

  opc.setStatusLed(false);
  opc.showLocations(true);

  // Register the LED positions on the screen
  float spacing = height / 16.0;
  float offset = spacing * 4;
  float mid_x = width / 2.0;

  opc.ledGrid8x8(64 * 0, mid_x - offset, height/4, spacing, 0, false);
  opc.ledGrid8x8(64 * 1, mid_x + offset, height/4, spacing, 0, false);
  opc.ledGrid8x8(64 * 2, mid_x - offset, 3 * height/4, spacing, 0, false);
  opc.ledGrid8x8(64 * 3, mid_x + offset, 3 * height/4, spacing, 0, false);
}

void draw() {
  background(0);

  ellipse(mouseX, mouseY, dotSize, dotSize);
}