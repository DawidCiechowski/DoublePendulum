float r1 = 250;
float r2 = 250;
float m1 = 40;
float m2 = 40;
float a1 = PI/3;
float a2 = PI/3;
float a1_v = 0;
float a2_v = 0;
float g = 1;

float px2 = -1;
float py2 = -1;
float cx = 0;
float cy = 0;

PGraphics canvas;

void setup() {
  size(900, 600);
  cx = width/2;
  cy = 50;
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(0);
  canvas.endDraw();
}

void draw() {
  float num1 = -g * (2 * m1 + m2) * sin(a1);
  float num2 = -m2 * g * sin(a1 - 2 * a2);
  float num3 = -2 * sin(a1  - a2) * m2;
  float num4 = a2_v * a2_v * r2 + a1_v * a1_v * r1* cos(a1 - a2);
  float denom = r1 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2 * a2));
  float a1_a = (num1 + num2 + num3 * num4) / denom;

  
  num1 = 2 * sin(a1 - a2);
  num2 = a1_v * a1_v * r1 * (m1 + m2);
  num3 = g * (m1 + m2) * cos(a1);
  num4 = a2_v * a2_v * r2  * m2 * cos(a1 - a2);
  denom = r2 * (2 * m1 + m2 - m2 * cos(2 * a1 - 2* a2));
  float a2_a = (num1 * (num2 + num3 + num4)) / denom;
 
  
  //background(255);
  image(canvas, 0, 0);
  stroke(255);
  strokeWeight(4);

  translate(cx, cy);

  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);

  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  

  line(0, 0, x1, y1);
  fill(255);
  ellipse(x1, y1, m1, m1);


  line(x1, y1, x2, y2);
  fill(255);
  ellipse(x2, y2, m2, m2);
  a1_v += a1_a;
  a2_v += a2_a;    
  a1 += a1_v;
  a2 += a2_v;
  
  a1 *= 0.999;
  a2 *= 0.999;
  

   float r = 255;
   float b = 255;
   float g = 255;
  canvas.beginDraw();
  canvas.translate(cx, cy);
  canvas.strokeWeight(1);
  canvas.stroke(r, g, b);
  if(frameCount > 1) {
    canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();
  
  px2 = x2;
  py2 = y2;
  if(r <= 155) {
    r += 0.1;
  } else {
    r = 155;
  }
  
    if(g <= 155) {
    g += 0.001;
  } else {
    r = 155;
  }
  
    if(b <= 155) {
    b += 0.001;
  } else {
    b = 155;
  }
}
