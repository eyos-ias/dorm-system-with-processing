TextField newStudentName;
TextField newStudentSex;
TextField newStudentAge;
TextField newStudentDept;
TextField newStudentBatch;
TextField newStudentDorm;
boolean formDone;
Button checkButton, createButton;
TextField creatableUserId;
boolean studentExistss;
// TextField creatableUserId;
String creatableIdValue, nameLength, sexLength, ageLength, deptLength, batchLength, dormLength;

void initPage5Elements() {
    helpersInit();
    formDone = false;
    studentExistss = true;
    String NUMBERSSS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 ";
    //instantiating
    checkButton = new Button();
    createButton = new Button();
    
    creatableUserId = new TextField("0000/00", width / 2 - 250, 278 + 200, 500, 78);
    creatableUserId.allowedInputChars = NUMBERSSS;
    
    //Form elements
    newStudentName = new TextField("Student's Name", width / 2 - 400, 100, 250, 45);
    newStudentName.allowedInputChars = NUMBERSSS;
    newStudentSex = new TextField("Student's Sex", width / 2 - 120, 100, 250, 45);
    newStudentSex.allowedInputChars = "MF";
    newStudentAge = new TextField("Student's Age", width / 2 + 160, 100, 250, 45);
    newStudentAge.allowedInputChars = "1234567890";
    
    newStudentDept = new TextField("Student's Department", width / 2 - 400, 165, 250, 45);
    newStudentDept.allowedInputChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
    newStudentBatch = new TextField("Student's Batch", width / 2 - 120, 165, 250, 45);
    newStudentBatch.allowedInputChars = "12345";
    newStudentDorm = new TextField("Student's Dorm", width / 2 + 160, 165, 250, 45);
    newStudentDorm.allowedInputChars = "BR1234567890-";
    
    //setting properties 
    checkButton.setProperties("Check",(width / 2) - 125, 590, 250, 78);
    checkButton.setFill(blue, 255, 255);
    
    createButton.setProperties("Create Student",(width / 2) - 100, 225, 200, 50);
    createButton.setFill(blue, 255, 255);
    BackToPage2Button.setProperties("Return",(width / 2) - 125, 390 + 280, 250, 78);
    BackToPage2Button.setFill(gray, 255, 255);
    
    container5 = new Container();
    container5.append(checkButton);
    container5.append(creatableUserId);
    container5.append(newStudentName);
    container5.append(newStudentSex);
    container5.append(newStudentAge);
    container5.append(newStudentDept);
    container5.append(newStudentBatch);
    container5.append(newStudentDorm);
    container5.append(createButton);
    container5.append(BackToPage2Button);
    
}

void page5UI() {
    prevPage = page;
    fill(#00337C);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("Please create the student's id number:", width / 2, 200 + 200);
    textSize(18);
    text("ets", 410, 278 + (78 / 2) + 200, 10);
    if (!studentExistss) {
        
    } else{
        fill(255);
        noStroke();
        rect(0,0, width, 300);
    }
}
void page5Logic() {
    
    creatableIdValue = creatableUserId.value;
    sexLength = newStudentSex.value;
    ageLength = newStudentAge.value;
    batchLength = newStudentBatch.value;
    if (creatableUserId.value.length() >= 6) {
        creatableIdValue = creatableUserId.value.substring(0,6);
        creatableUserId.value = creatableIdValue;
    }
    if (newStudentSex.value.length()>= 2) {
        sexLength = newStudentSex.value.substring(0,1);
        newStudentSex.value = sexLength;
    }
    if (newStudentAge.value.length()>= 2) {
        ageLength = newStudentAge.value.substring(0,2);
        newStudentAge.value = ageLength;
    }
    if (newStudentBatch.value.length()>= 1) {
        batchLength = newStudentBatch.value.substring(0,1);
        newStudentBatch.value = batchLength;
    }
    
    //form Validation
    if (checkButton.clicked) {
        println("checking");
        for (Student student : studentList) {
            if (student.studentId.equals(creatableUserId.value)) {
                studentExistss = true;
                break;
            }
            studentExistss = false;
        }
        if (studentExistss) {
            creatableUserId.error = true;
            println("studentExistss");
        } else{
            creatableUserId.error = false;
            println("student doesnot exist");
        }
        println(studentExistss);
    }
    if (BackToPage2Button.clicked) {
        page = 2;
        println("back to page 2 from page 4");
    }
    
    //adding the student
    if (createButton.clicked) {
        if (newStudentName.value.equals("") || newStudentSex.value.equals("") || newStudentAge.value.equals("") || newStudentDept.value.equals("") || newStudentBatch.value.equals("") || newStudentDorm.value.equals("")) {
            if (newStudentName.value.equals("")) {
                newStudentName.error = true;
            }
            if (newStudentSex.value.equals("")) {
                newStudentSex.error = true;
            }
            if (newStudentAge.value.equals("")) {
                newStudentAge.error = true;
            } if (newStudentDept.value.equals("")) {
                newStudentDept.error = true;
            } if (newStudentBatch.value.equals("")) {
                newStudentBatch.error = true;
            }
            if (newStudentDorm.value.equals("")) {
                newStudentDorm.error = true;
            }
            println("form not filled");
        } else{
            println("form filled");
            Student newStudent = new Student(newStudentName.value, newStudentSex.value, newStudentAge.value, newStudentDept.value, newStudentBatch.value, newStudentDorm.value, creatableUserId.value);
            // studentList.add(newStudent);
            
            // Student[] newStudentList = new Student[studentList.length];
            // studentList = append(studentList, newStudent);
            //  studentList = append(studentList, new Student("98765", "John Doe", "Male", "20", "Computer Science", "2023", "Dorm A"));
            // PrintWriter writer = createWriter("students.csv");
            // writer.println("ID,Name,Sex,Age,Department,Batch,Dorm");
            // for (int i = 0; i < studentList.length; i++) {
            //     Student s = studentList[i];
            //     writer.println(s.studentId + "," + s.studentName + "," + s.studentSex + "," + s.studentAge + "," + s.studentDept + "," + s.studentBatch + "," + s.studentDorm);
            // }
            // writer.flush();
            // writer.close();
            println("student added");
            newStudentName.value = "";
            newStudentSex.value = "";
            newStudentAge.value = "";
            newStudentDept.value = "";
            newStudentBatch.value = "";
            newStudentDorm.value = "";
            creatableUserId.value = "";
            
        }
        
        
    }
    
}


// void addStudenttoCsv() {
//     if (newStudentName.value.equals("") || newStudentSex.value.equals("") || newStudentAge.value.equals("") || newStudentDept.value.equals("") || newStudentBatch.value.equals("") || newStudentDorm.value.equals("")) {
//         println("form not filled");
//     } else{
//         println("form filled");
//         Student newStudent = new Student(newStudentName.value, newStudentSex.value, newStudentAge.value, newStudentDept.value, newStudentBatch.value, newStudentDorm.value, creatableUserId.value);
//         studentList.add(newStudent);
//         println("student added");
//         newStudentName.value = "";
//         newStudentSex.value = "";
//         newStudentAge.value = "";
//         newStudentDept.value = "";
//         newStudentBatch.value = "";
//         newStudentDorm.value = "";
//         creatableUserId.value = "";

//     }
// }