class Student {
  String studentId;
  String studentName;
  String studentSex;
  String studentAge;
  String studentDept;
  String studentBatch;
  String studentDorm;
  
  Student(String id, String name, String sex, String age, String dept, String batch, String dorm){
    this.studentId = id;
    this.studentName = name;
    this.studentSex = sex;
    this.studentAge = age;
    this.studentDept = dept;
    this.studentBatch = batch;
    this.studentDorm = dorm;
  }
  void changeDorm(String newDorm){
   this.studentDorm = newDorm; 
  }
}
