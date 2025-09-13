public void setup() {
  size(800,800);

  background(255);

  // one scale in center
  int lightWash = color(200, 220, 255); // light blue
  int deepHue   = color(30, 140, 150);  // dark teal
  
  boolean shift = true;
  
    for(int y = 800; y>-200; y = y - 30){
      for(int x = -200; x<=1000; x +=80){
      if(shift == true)
        drawScale(x + (int)(Math.random()*10), y + (int)(Math.random()*10), 100, deepHue, lightWash);
      else
        drawScale(x + (int)(Math.random()*10 + 40), y + (int)(Math.random()*10), 100, deepHue + (int)(Math.random()*30), lightWash);
    }
    if(shift == true)
      shift = false;
     else
       shift = true;
  }
}



public void draw(){
  
}
 // param cx, cy  center position
 // param s       overall size (height)
 // param c1      inner/deep color
 // param c2      outer/light color

void drawScale(float cx, float cy, float s, int c1, int c2) {
  pushMatrix();
  translate(cx, cy);

  int layers = 35;             
  float shrink = 0.012;        // how much each layer shrinks

  noStroke();
  for (int i = 0; i < layers; i++) {
    float t = i/(float)(layers-1);      
    // blend colors from c1 to c2
    int col = lerpColor(c1, c2, t);
    fill(red(col), green(col), blue(col));
    
    pushMatrix();
    scale(1 - i*shrink);  
    teardropShape(s);
    popMatrix();
    
  }

  // faint outline
  noFill();
  stroke(40, 60);
  strokeWeight(1.25);
  teardropShape(s*0.985);

  popMatrix();
}

  // outline centered at (0,0),

void teardropShape(float h) {
  float w = h * 0.65;    // width proportion
  beginShape();
  // start at upper center
  vertex(0, -h*0.55);
  // right arc down to tip
  bezierVertex(+w*0.70, -h*0.20, +w*0.95, +h*0.25, 0, +h*0.95);
  // left arc back up to start
  bezierVertex(-w*0.95, +h*0.25, -w*0.70, -h*0.20, 0, -h*0.55);
  endShape(CLOSE);
}
