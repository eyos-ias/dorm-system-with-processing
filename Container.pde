import java.util.Stack;

class Container {
  Stack <Object> container;

  Container () {
    container = new Stack <Object> ();
  }

  void draw () {
    for (int a = 0; a < container.size (); a ++) {
      if (container.get (a).getClass() == TextField.class) {
        TextField tf = (TextField) container.get (a);
        tf.draw ();
      } else if (container.get(a).getClass() == Button.class) {
        Button btn = (Button) container.get(a);
        btn.draw();
      } 
    }
  }

  void mousePressed () {
    for (int a = 0; a < container.size (); a ++) {
      if (container.get (a).getClass() == TextField.class) {
        TextField tf = (TextField) container.get (a);
        tf.mousePressed ();
      } 
      
      else if (container.get(a).getClass() == Button.class) {
        Button btn = (Button) container.get(a);
        btn.mousePressed();
      }
    }
  }

  void keyPressed () {
    for (int a = 0; a < container.size (); a ++) {
      if (container.get (a).getClass() == TextField.class) {
        TextField tf = (TextField) container.get (a);
        tf.keyPressed ();
      } else if (container.get (a).getClass() == Button.class) {
        Button btn = (Button) container.get(a);
        btn.keyPressed();
      } 
    
    }
  }

  void keyPressed (KeyEvent e) {
    int cycleDirection = 0;
    if (e.isShiftDown() && keyCode == TAB) cycleDirection = -1;
    else if (keyCode == TAB) cycleDirection = 1;

    if (cycleDirection != 0 && container.size () > 1) {
      for (int a = 0; a < container.size (); a ++) {
        if (!(
          container.get (a).getClass() == TextField.class ||
          container.get(a).getClass() == Button.class 
          ))
          continue;

        int nextIndex = (a == container.size () - 1? 0 : a + 1);
        int prevIndex = (a == 0? container.size () - 1 : a - 1);
        int index = cycleDirection == 1? nextIndex : prevIndex;

        if (container.get (a).getClass() == TextField.class) {

          TextField tf = (TextField) container.get (a);
          if (tf.active) {
            tf.active = false;
            container.set (a, tf);
            activateElement (index);
            break;
          }
        } 
        else if (container.get (a).getClass() == Button.class) {
          Button btn = (Button) container.get (a);
          if (btn.active) {
            btn.active = false;
            container.set (a, btn);
            activateElement (index);
            break;
          }
        } 
      }
    }
  }

  void activateElement (int index) {
    if (container.get (index).getClass() == TextField.class) {
      TextField tf = (TextField) container.get (index);
      tf.active = true;
      container.set (index, tf);
    } 
     
    else if (container.get(index).getClass()==Button.class) {
      Button btn = (Button) container.get(index);
      btn.active = true;
      container.set(index, btn);
    } 
    
  }

  void append (Object o) {
    container.add (o);
  }

  int size () {
    return container.size ();
  }

  Object get (int index) {
    return container.get (index);
  }

  void set (int index, Object object) {
    container.set (index, object);
  }
}
