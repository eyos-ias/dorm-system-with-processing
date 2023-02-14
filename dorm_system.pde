//master
/* 
  PAGE 1 = SIGN IN
  PAGE 2 = SELECTION
  PAGE 3 = SEARCH & SEARCH RESULTS
  PAGE 4 = CHANGE ID & CHANGE PAGE/RESULT
  PAGE 5 = CREATE ID, CREATE INFORMATION & SUCCESS PAGE
*/
Student[] studentList;
Container container1, container2, container3, container4, container5; // Container of UI Elements (TextFields, DropDownMenus & Buttons) for different pages
int page=1;
String allowedNumbers = "1234567890";
void setup () {
  // adds the students in the csv to an array of student objects
   String[] lines = loadStrings("students.csv");
   studentList = new Student[lines.length -1];
   for(int i = 1; i<lines.length; i++){
    String[] studentData = split(lines[i], ",");
    String id = studentData[0];
    String name = studentData[1];
    String sex = studentData[2];
    String age = studentData[3];
    String department = studentData[4];
    String batch = studentData[5];
    String dorm = studentData[6];
    studentList[i-1] = new Student(id, name, sex, age, department, batch, dorm);
   }
   
   println(studentList.length);
  
  
  size (1366, 768);
  // Initialize the pages' UI elements
  initPage1Elements (); 
  initPage2Elements ();
  initPage3Elements ();
  initPage4Elements ();
  initPage5Elements ();
 }

void draw () {
  background (white);
  if (page==1) {
    container1.draw ();
    page1UI();
  } else if (page==2) {
    page2UI();
    container2.draw();
  } else if(page == 3){
    page3UI();
    container3.draw();
  } else if(page ==4){
   container4.draw();
   page4UI();
  } else if(page == 5){
   container5.draw(); 
   page5UI();
  }
  //println(mouseX,mouseY);
}

void mousePressed () {
  if (page==1) {
    container1.mousePressed();
    page1Logic();
  } else if (page==2) {
    container2.mousePressed();
    page2Logic();
  } else if(page==3){
    container3.mousePressed();
   page3Logic();
  } else if(page==4){
   container4.mousePressed(); 
   page4Logic();
  } else if(page ==5){
    container5.mousePressed();
    page5Logic();
    
  }
}

void keyPressed () {
  //conditionally or it will listen to keyPressed event of page7 while being at page 1
  if (page==1) {
    container1.keyPressed();
    page1Logic();
  } else if (page==2) {
    container2.keyPressed();
    page2Logic();
  } else if(page==3){
    container3.keyPressed();
  } else if(page ==4){
     container4.keyPressed(); 
  } else if(page ==5){
   container5.keyPressed(); 
  }
}

void keyPressed (KeyEvent e) {
  keyPressed ();
  if (page==1) {
    container1.keyPressed(e);
    page1Logic();
  } else if (page==2) {
    container2.keyPressed(e);
    page2Logic();
  } else if(page==3){
   container3.keyPressed(e);
   page3Logic();
  } else if(page==4){
    container4.keyPressed(e);
    page4Logic(); 
  } else if(page ==5){
   container5.keyPressed(e); 
   page5Logic();
  }
}
