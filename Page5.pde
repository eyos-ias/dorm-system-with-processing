TextField creatableUserId;
Button createButton;
void initPage5Elements() {
  helpersInit();
  String NUMBERSSS = "0123456789";
  // instantiating
  createButton = new Button();

  //userName = new TextField ("user name", (width/2)-250, (height/3), 500, 78);
  creatableUserId = new TextField("0000/00", width/2-250, 278, 500, 78);
  creatableUserId.allowedInputChars = NUMBERSSS;
  // setting properties 
  createButton.setProperties("Create", (width/2)-125, 390, 250, 78);
  createButton.setFill(blue, 255, 255);

  BackToPage2Button.setProperties("Return", (width/2)-125, 390 + 280, 250, 78);
  BackToPage2Button.setFill(gray, 255, 255);

  container5 = new Container();
  container5.append(createButton);
  container5.append(creatableUserId);
  container5.append(BackToPage2Button);
}

void page5UI() {
  prevPage = page;
  fill (#00337C);
  textSize (50);
  textAlign(CENTER, CENTER);
  text ("Please create the student's id number:", width/2, 200);
  textSize(18);
  text("ets", 410, 278+(78/2), 10);
}
void page5Logic() {
  if (BackToPage2Button.clicked) {
    page = 2;
    println("back to page 2 from page 4");
  }
}
