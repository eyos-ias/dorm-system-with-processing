//Change Page
Student changeableStudent;
TextField changeableUserId;
TextField newDorm;
Button changeDorm;
Button continueButton;
String changeableIdValue;

void initPage4Elements() {
    helpersInit();
    studentExists = false;
    String NUMBERSS = "0123456789";
    String DORM = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-";
    //instantiating
    continueButton = new Button();
    changeDorm = new Button();
    //userName = new TextField ("user name", (width/2)-250, (height/3), 500, 78);
    changeableUserId = new TextField("0000/00", width / 2 - 250, 278 + 200, 500, 78);
    changeableUserId.allowedInputChars = NUMBERSS;
    newDorm = new TextField("new Dorm", 230, 333, 250, 40);
    newDorm.allowedInputChars = DORM;
    
    //setting properties 
    continueButton.setProperties("Continue",(width / 2) - 125, 560, 250, 78);
    continueButton.setFill(blue, 255, 255);
    
    BackToPage2Button.setProperties("Return",(width / 2) - 125, 390 + 100, 250, 78);
    BackToPage2Button.setFill(gray, 255, 255);
    
    changeDorm.setProperties("change", 230 + 270, 330, 100, 50);
    changeDorm.setFill(blue, 255, 255);
    
    container4 = new Container();
    container4.append(continueButton);
    container4.append(changeableUserId);
    container4.append(BackToPage2Button);
    container4.append(newDorm);
    container4.append(changeDorm);
}

void page4UI() {
    prevPage = page;
    fill(#00337C);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Please insert the student's id number:", width / 2, 200 + 200);
    textSize(18);
    text("ets", 410, 278 + (78 / 2) + 200, 10);
    
    if(studentExists) {
        //fill(70, 70, 70);
        textSize(40);
        textAlign(LEFT, LEFT);
        fill(0,0,255);
        text("Student Details: -", width / 2 - 300, 55);
        textSize(20);
        fill(70,70,70);
        text("Name: " + changeableStudent.studentName, width / 2 - 300, 100);
        fill(0,0,255);
        text("Dorm: " + changeableStudent.studentDorm, width / 2 - 300, 155);
        
} else {
    fill(255);
    noStroke();
    rect(222, 319, 384, 61);
}
    
}
void page4Logic() {
    //limiting userId's digits
    changeableIdValue = changeableUserId.value;
    if (changeableUserId.value.length() >= 6) {
        changeableIdValue = changeableUserId.value.substring(0,6);
        changeableUserId.value = changeableIdValue;
    }
    if (studentExists && changeDorm.clicked && newDorm.value.length() != 0) {
        println("CHANGE!");
        changeableStudent.changeDorm(newDorm.value);
        
        //writing changes to the file
        PrintWriter writer = createWriter("students.csv");
        writer.println("ID,Name,Sex,Age,Department,Batch,Dorm");
        for (Student s : studentList) {
    writer.println(s.studentId + "," + s.studentName + "," + s.studentSex + "," + s.studentAge + "," + s.studentDept + "," + s.studentBatch + "," + s.studentDorm);
}

        writer.flush();
        writer.close();
        newDorm.value = "";
    }
    if(continueButton.clicked) {
        studentExists = false;
        println("clicked");
        for (Student student : studentList) {
           if (student.studentId.equals(changeableUserId.value)) {
                changeableStudent = student;
                studentExists = true;
                break;
        }
        }
        
        if (changeableStudent != null) {
            println("Student found!");
            println("Name: " + changeableStudent.studentName);
            println("Sex: " + changeableStudent.studentSex);
            println("Age: " + changeableStudent.studentAge);
            println("Department: " + changeableStudent.studentDept);
            println("Batch: " + changeableStudent.studentBatch);
        }
}
    
    if (BackToPage2Button.clicked) {
        changeableUserId.value = "";
        studentExists = false;
        page= 2;
        println("back to page 2 from page 4");  
    }
    }
        