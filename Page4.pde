//Change Page

TextField changeableUserId;
Button changeButton;
void initPage4Elements() {
  helpersInit();
  String NUMBERSS = "0123456789";
  // instantiating
  changeButton = new Button();
  
  //userName = new TextField ("user name", (width/2)-250, (height/3), 500, 78);
  changeableUserId = new TextField("0000/00", width/2-250, 278 + 200, 500, 78);
  changeableUserId.allowedInputChars = NUMBERSS;
  // setting properties 
  changeButton.setProperties("Continue", (width/2)-125, 560, 250, 78);
  changeButton.setFill(blue, 255, 255);
  
  BackToPage2Button.setProperties("Return", (width/2)-125, 390 + 100, 250, 78);
  BackToPage2Button.setFill(gray, 255, 255);
  
  container4 = new Container();
  container4.append(changeButton);
  container4.append(changeableUserId);
  container4.append(BackToPage2Button);
 
}

void page4UI() {
  prevPage = page;
  fill (#00337C);
  textSize (50);
  textAlign(CENTER, CENTER);
  text ("Please insert the student's id number:", width/2, 200 + 200);
  textSize(18);
  text("ets", 410, 278+(78/2) + 200, 10);
}
void page4Logic() {
    
  
  
  if(BackToPage2Button.clicked){
    page = 2;
    println("back to page 2 from page 4");  
}
}
