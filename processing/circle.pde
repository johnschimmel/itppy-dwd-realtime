class Circle {
  color theColor;
  int xpos, ypos,size;
  String id;

  Circle(String _color, int _xpos, int _ypos, int _size, String _id) {
    xpos = _xpos;
    ypos = _ypos;
    size = _size;
    id = _id;
    
    // deal with String to hex color
    // taken from http://processing.org/discourse/beta/num_1268833732.html
    String c = "FF" + (String)_color;
    theColor = unhex(c);

  }

  void display() {
    noStroke();
    fill(theColor);
    ellipse(xpos, ypos, size, size);
    
  }
}

