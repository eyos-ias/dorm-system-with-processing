//SEARCH PAGE

Button  searchButton, BackToPage2Button;
String IdValue;
Student searchedStudent;
Boolean studentExists = false;
String SearchButtonValue = "Search";
TextField searchableUserId;


void initPage3Elements() {
  helpersInit();
  String NUMBERSS = "0123456789";
  // instantiating
  searchButton = new Button();
  BackToPage2Button = new Button();
  //userName = new TextField ("user name", (width/2)-250, (height/3), 500, 78);
  searchableUserId = new TextField("0000/00", width/2-250, 278 + 200, 500, 78);
  searchableUserId.allowedInputChars = NUMBERSS;
  // setting properties 
  searchButton.setProperties("Search", (width/2)-125, 390 + 180, 250, 78);
  searchButton.setFill(blue, 255, 255);

  BackToPage2Button.setProperties("Return", (width/2)-125, 390 + 100 + 300, 250, 78);
  BackToPage2Button.setFill(gray, 255, 255);

  container3 = new Container();

  container3.append(searchButton);
  container3.append(searchableUserId);

  container3.append(BackToPage2Button);
}

void page3UI() {
  prevPage = page;
  fill (#00337C);
  textSize (50);
  textAlign(CENTER, CENTER);
  text ("Please insert the student's id number:", width/2, 200 + 200);
  textSize(18);
  text("ets", 410, 278+(78/2) + 200, 10);
  if (studentExists) {
    //fill(70, 70, 70);
    textSize(40);
    textAlign(LEFT, LEFT);
    fill(0,0,255);
    text("Student Details: -", width/2-300, 55);
    textSize(20);
    fill(70,70,70);
    text("Name: "+searchedStudent.studentName, width/2-300, 100);
    text("Sex: " + searchedStudent.studentSex, width/2-300, 155);
    text("Age: " + searchedStudent.studentAge, width/2-300, 205);
    text("Department: " + searchedStudent.studentDept, width/2-300, 260);
    text("Academic Year: " + searchedStudent.studentBatch, width/2-300, 315);
    fill(0,0,255);
    text("Dorm: " + searchedStudent.studentDorm, width/2-300, 365);
  } else {
  }
  
}
void page3Logic() {
  //limiting userId's digits
  IdValue = searchableUserId.value;
  if (searchableUserId.value.length() >= 6) {
    IdValue = searchableUserId.value.substring(0, 6);
    searchableUserId.value = IdValue;
  }
  //

  if (BackToPage2Button.clicked) {
    page = 2;
    //form clearance
    studentExists = false;
    searchableUserId.value = "";

    //println("back to page 2 form page 3");
    //println(searchableUserId.value);
  }
  if (searchButton.clicked) {
    studentExists=false;
    println("clicked");
    for (Student student : studentList) {

      if (student.studentId.equals(searchableUserId.value)) {
        searchedStudent = student;
        studentExists=true;
        break;
      }
    }
    if (searchedStudent != null) {
      println("Student found!");
      println("Name: " + searchedStudent.studentName);
      println("Sex: " + searchedStudent.studentSex);
      println("Age: " + searchedStudent.studentAge);
      println("Department: " + searchedStudent.studentDept);
      println("Batch: " + searchedStudent.studentBatch);
      // studentExists = true;
      // String studentAge;
      //String studentDept;
      //String studentBatch;
    }
  }
}
