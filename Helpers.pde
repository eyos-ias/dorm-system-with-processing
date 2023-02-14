PImage profileBackground;
PImage profile;
PShape moon;
boolean dark = false;
void helpersInit() {
}

void sideBar() {
  noTint();
  noStroke();
  fill(#F9F8F8);
  rect (0, 0, 293, 768);

  fill(255);
  circle(240, 30, 33);

  fill (255);
  textSize (25);
  textAlign(LEFT, CENTER);
  text (userName.value, 30, 165);

}
void clearContainerValues(Container c) {
  for (int i = 0; i<c.size(); i++) {
    if (c.get(i).getClass() == TextField.class ) {
      TextField tf = (TextField) c.get (i);
      tf.value = "";
    } 
 
  }
}
boolean emptyTextFieldError(Container c) {
  boolean emptyField = false;
  for (int i = 0; i<c.size(); i++) {
    if (c.get(i).getClass() == TextField.class ) {
      TextField tf = (TextField) c.get (i);
      if (tf.value == "") {
        emptyField = true;
        tf.showErrorText("This Field is required");
      }
    }
  }
  return emptyField;
}
String valuesJoin(Container c) {
  String joinedValue="";
  for (int i = 0; i<c.size(); i++) {
    if (c.get(i).getClass() == TextField.class ) {
      TextField tf = (TextField) c.get (i);
      joinedValue+= tf.label.substring(0, 2)+":" + tf.value + ",";
    }

  }
  joinedValue=joinedValue.substring(0, joinedValue.length()-1);
  return joinedValue;
}

void fillContainerValues(Container c, String[] s) {
  for (int i = 0; i<c.size(); i++) {
    if (c.get(i).getClass() == TextField.class ) {
      TextField tf = (TextField) c.get (i);
      tf.value = s[i];
    } 

  }
}

StringList toStringList (String str []) {
  StringList output = new StringList ();
  if (str != null) {
    for (String element : str) output.append(element);
  }
  return output;
}
StringList toStringList (String str [], int lengthLimit) {
  StringList output = new StringList ();
  if (str != null) {
    for (String element : str) {
      if (lengthLimit -- > 0) output.append(element);
      else break;
    }
  }
  return output;
}

float similarity(String s1, String s2) {
  String longer = s1, shorter = s2;
  if (s1.length() < s2.length()) {
    longer = s2; 
    shorter = s1;
  }
  int longerLength = longer.length();
  return ((longerLength == 0)? 1.0 : (longerLength - editDistance(longer, shorter)) / (float) longerLength);
}
public static int editDistance(String s1, String s2) {
  s1 = s1.toLowerCase();
  s2 = s2.toLowerCase();
  int [] costs = new int[s2.length() + 1];
  for (int i = 0; i <= s1.length(); i++) {
    int lastValue = i;
    for (int j = 0; j <= s2.length(); j++) {
      if (i == 0)
        costs[j] = j;
      else {
        if (j > 0) {
          int newValue = costs[j - 1];
          if (s1.charAt(i - 1) != s2.charAt(j - 1))
            newValue = Math.min(Math.min(newValue, lastValue), 
              costs[j]) + 1;
          costs[j - 1] = lastValue;
          lastValue = newValue;
        }
      }
    }
    if (i > 0)
      costs[s2.length()] = lastValue;
  }
  return costs[s2.length()];
}
