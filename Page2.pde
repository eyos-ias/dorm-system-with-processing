//SELECTION PAGE

Button  searchNavigator, changeNavigator, createNavigator;

int prevPage = 1;

void initPage2Elements() {
  helpersInit();

  // instantiating the buttons
  searchNavigator = new Button();
  changeNavigator = new Button();
  createNavigator = new Button();

  // setting properties the buttons

  searchNavigator.setProperties("Search for Student Info", width/2 - 250, 278, 500, 78);
  searchNavigator.setFill(blue, 255, 255);

  changeNavigator.setProperties("Change Student Info", width/2 - 250, 278 + 100, 500, 78);
  changeNavigator.setFill(blue, 255, 255);

  createNavigator.setProperties("Create New Student Info", width/2 - 250, 278 + 100 + 100, 500, 78);
  createNavigator.setFill(blue, 255, 255);

  container2 = new Container();
  container2.append(searchNavigator);
  container2.append(changeNavigator);
  container2.append(createNavigator);
}

void page2UI() {
  prevPage = page;

  fill (#00337C);

  textSize (50);
  textAlign(CENTER, CENTER);
  text ("Welcome back Admin, select a task:", width/2, 200);
}
void page2Logic() {
  if(searchNavigator.clicked){
    page = 3;
  } else if(changeNavigator.clicked){
   page = 4; 
  } else if(createNavigator.clicked){
   page = 5; 
  }
}
