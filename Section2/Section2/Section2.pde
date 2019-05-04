int levels;
color bg,fg;
float theight;
float twidth;

void setup() {
  size(800, 600);
  levels = 0;
  theight = 0;
  twidth = 0;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void drawtriangles() {
  
}
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    fill(255,0,0);
    twidth = v2x - v1x;
    theight = v1y - v3y;
    twidth /= (levels + 1);
    theight /= (levels + 1);
    triangle(v1x,v1y,1,1,1,1);
    for(int i = levels + 1; i > 0; i--) {
      for(int j = 0; j < i; j++) {
        triangle(v1x + j * (twidth),v1y, v1x + (j + 1) * twidth, v1y, v1x + j * (twidth) + (twidth / 2.0), v1y - theight)  ;
      }
      v1y -= theight;
      v1x += (twidth / 2.0);
    }
    
    //YOU WRITE THIS METHOD!
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levles",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 levels ++;  
}

void keyPressed(){
 if (levels > 0) {
 levels --; 
 }
}