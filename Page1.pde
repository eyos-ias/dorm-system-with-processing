TextField userName, loginPassword;
//DropDownMenu phoneType;
Button loginBtn;

boolean showErrors=false;
//PImage logo, cross, pill, signatureImage;
float tfs = 108; //textField separation 
void initPage1Elements () {
  
  userName = new TextField ("user name", (width/2)-250, (height/3), 500, 78);
  loginPassword = new TextField("password", (width/2)-250, (height/3)+tfs, 500, 78 );
  
  loginBtn = new Button();
  
  container1 = new Container();

  loginBtn.setProperties("Sign In", (width/2)-250, (height/3)+tfs*2, 500, 78);
  loginBtn.setFill( blue, 255, 255);
  loginBtn.setSize(28);
  
  container1.append (userName);
  container1.append(loginPassword);
  container1.append(loginBtn);
}

void page1UI () {
  
  textSize(37);
  text("Welcome Back!", width/2, 200);
  if(showErrors){
    fill(255,0,0);
    textSize(16);
    text("wrong username or password", width/2, 580);
    text("both username and password are probably 'admin'", width/2, 620);
  }
}

void page1Logic() {
  if (loginBtn.clicked) {
    showErrors = false;
    if(userName.value.equals("admin") && loginPassword.value.equals("admin")){
      page = 2;
    }else{
    showErrors = true;
    println("username:" + userName.value);
    println("password:" + loginPassword.value);
    }
  }
}
