class Button {

  String label ="Next";

  float x = 600, y = 400;
  float w = 145, h = 64;
  float cornerRadius =10;

  color blue = #00337C, darkBlue = #097FAA, blueBlack = #056385;
  color lightGrey = #F9F8F8, grey =#E6EAEA, darkGrey =#DEE0E0 ;
  color fill = #000000;
  color textFill;
  color stroke;

  int mode=0;

  boolean clicked = false, active=false;
  boolean settingMode;

  int size=25;

  int ORIENTATION = RIGHT;

  PShape icon;
  //PFont font;

  //Fonts fonts;

  void setProperties (String label, float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;

    this.label = label;
    //fonts = new Fonts();
    //this.font = fonts.roboto.regular;
  }

  void setIcon (String path, int ORIENTATION) {
    icon = loadShape (path);
    icon.disableStyle();
    icon.scale (1);

    this.ORIENTATION = ORIENTATION;
  }

  void setSize(int size) {
    this.size=size;
  }

  void setFill (color fill, color textFill, color stroke) {
    this.fill = fill;
    this.textFill=textFill;
    this.stroke=stroke;
  }

  void draw() {
    noStroke();
    if (mode==0) {
      if ((mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) || active) {
        if (mousePressed) {
          fill (blueBlack);
        } else {
          fill (darkBlue);
        }
      } else {
        fill (blue);
      }
      button();
    } else if (mode==1) {
      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h || active) {
        if (mousePressed) {
          fill (darkGrey);
        } else {
          fill (grey);
        }
      } else {
        fill (lightGrey);
      }
      button();
    } else if (mode==2) {
      strokeWeight(2);
      stroke(blue);
      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h || active) {
        if (mousePressed) {
          fill (darkGrey);
        } else {
          fill (grey);
        }
      } else {
        fill (lightGrey);
      }
      button();
    }
  }
  void button () {
    rect (x, y, w, h, cornerRadius);


    //textFont (font);
    fill(textFill);
    textSize (size);

    textAlign (CENTER, CENTER);
    if (ORIENTATION == RIGHT)
      text (label, x + w/2, y + h/2 - textDescent ()/2);
    else if (ORIENTATION == LEFT)
      text (label, x + w/2, y + h/2 - textDescent ()/2);

    shapeMode (CENTER);
    fill (blue);
    if (icon != null) {
      if (ORIENTATION == RIGHT)
        shape (icon, x + w - 35, y + h/2 -5+ icon.height*0.5/2);
      else if (ORIENTATION == LEFT)
        shape (icon, x + 35, y + h/2 - 5+icon.height*0.5/2);
    }
  }

  void mousePressed () {
    clicked = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
    active = mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h;
  }
  void keyPressed() {
    if (active && keyCode == ENTER) {
      println(clicked);
      clicked = true;
      println(clicked);
    }
  }
}
