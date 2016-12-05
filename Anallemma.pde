import processing.serial.*;  
import controlP5.*;
import javax.swing.*;
Serial port;

ControlP5 cp5;

Textfield P;
Textfield I;
Textfield D;
Textfield targetAngle;

String stringP = "";
String stringI = "";
String stringD = "";
String stringTargetAngle = "";

PFont f;

boolean useDropDownLists = true; // Set if you want to use the dropdownlist or not
byte defaultComPort = 0;
int defaultBaudrate = 115200;

int ROpen_hh = 23 ;
int ROpen_mm= 5 ;
int ROpen_ss = 00 ;
int RClose_hh = 4 ;
int RClose_mm= 00 ;
int RClose_ss = 00 ;

//Dialog
int messageBoxResult = -1;



//Dropdown lists
DropdownList COMports; // Define the variable ports as a Dropdownlist.
Serial serial; // Define the variable port as a Serial object.
int portNumber = -1; // The dropdown list will return a float value, which we will connvert into an int. We will use this int for that.

DropdownList baudrate;
int selectedBaudrate = -1; // Used to indicate which baudrate has been selected
String[] baudrates = {
  "1200", "2400", "4800", "9600", "19200", "38400", "57600", "115200" // these are the supported baudrates by a module
};

DropdownList ROpen_HH;
int selectedOH = -1; // Used to indicate which baudrate has been selected
String[] OH = {
  "00", "01", "02", "03", "04", "05" // Open Hour
};

boolean connectedSerial;
boolean aborted;
boolean isPressedCh1Button = false;
boolean isPressedCh2Button = false;
boolean isPressedCh3Button = false;
boolean isPressedCh4Button = false;
boolean isPressedCh5Button = false;
//boolean isPressedCh6Button = false;
//boolean isPressedCh7Button = false;
//boolean isPressedCh8Button = false;
boolean isPressedautoButton = false;

// schduling

int status_text_x = 300 ;
int status_text_y = 32 ;
int ch_button_x0 = 20 ;
int ch_button_y0 = 300 ;
int ch_button_w = 90 ;
int ch_button_h = 70 ;
// schduling

int start_hh = 23 ;
int start_mm= 5 ;
int start_ss = 00 ;

void setup()
{
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  
  cp5 = new ControlP5(this);
  size(550, 650);

  f = loadFont("Arial-BoldMT-30.vlw");
  textFont(f, 30);
  
 //println(serial.list()); // Used for debugging
  if (useDropDownLists)
  {
    /* Drop down lists */
    COMports = cp5.addDropdownList("COMPort", 20, 70, 100, 200); // Make a dropdown list with all comports
    customize(COMports); // Setup the dropdownlist by using a function

    baudrate = cp5.addDropdownList("Baudrate", 120, 70, 55, 200); // Make a dropdown with all the available baudrates   
    customize(baudrate); // Setup the dropdownlist by using a function

    ROpen_HH = cp5.addDropdownList("OH", 385, 98, 25, 200); // Make a dropdown with all the available RoofOpen   
    customize(ROpen_HH); // Setup the dropdownlist by using a function

    cp5.addButton("Connect", 0, 185, 70, 52, 15);
    cp5.addButton("Disconnect", 0, 185, 88, 52, 15);
  }
  else // if useDropDownLists is false, it will connect automatically at startup
  {
    serial = new Serial(this, Serial.list()[defaultComPort], defaultBaudrate);
    serial.bufferUntil('\n');
    connectedSerial = true;
    serial.write("G;"); // Go
  }
  background(0);
  set_buttons();
}


void Abort(int theValue)
{
  if (connectedSerial) 
  {
    serial.write("A;");
    aborted = true;
  }
  else
    println("Establish a serial connection first!");
}
void Continue(int theValue)
{
  if (connectedSerial) 
  {
    serial.write("C;");
    aborted = false;
    background(100);
  }
  else
    println("Establish a serial connection first!");
}
void Submit(int theValue) 
{
  if (connectedSerial)
  {    
      delay(10);    
  }
  else
    println("Establish a serial connection first!");
}

void serialEvent(Serial serial)
{
  
}
void keyPressed() 
{
  
}
void customize(DropdownList ddl) 
{
  ddl.setBackgroundColor(color(200));//Set the background color of the line between values
  ddl.setItemHeight(20);//Set the height of each item when the list is opened.
  ddl.setBarHeight(15);//Set the height of the bar itself.

  ddl.getCaptionLabel().getStyle().marginTop = 3;//Set the top margin of the lable.  
  ddl.getCaptionLabel().getStyle().marginLeft = 3;//Set the left margin of the lable.  
  ddl.getCaptionLabel().getStyle().marginTop = 3;//Set the top margin of the value selected.

  if (ddl.getName() == "Baudrate")
  {
    ddl.getCaptionLabel().set("Baudrate");
    for (int i=0; i<baudrates.length; i++)
      ddl.addItem(baudrates[i], i); // give each item a value
  }
  else if (ddl.getName() == "COMPort")
  {
    ddl.getCaptionLabel().set("Select COM port");//Set the lable of the bar when nothing is selected.
    //Now well add the ports to the list, we use a for loop for that.
    for (int i=0; i<serial.list().length; i++)    
      ddl.addItem(serial.list()[i], i);//This is the line doing the actual adding of items, we use the current loop we are in to determin what place in the char array to access and what item number to add it as.
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isGroup()) {
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    if (theEvent.getName() == "COMPort")
          portNumber = int(theEvent.getController().getValue());
    else if(theEvent.getName() == "Baudrate")
          selectedBaudrate = int(theEvent.getController().getValue());
  }
}

void Connect(int theValue)
{
  println("port Num = " + Serial.list()[portNumber]);
  if (selectedBaudrate != -1 && portNumber != -1 && !connectedSerial)//Check if com port and baudrate is set and if there is not already a connection established
  {
    println("ConnectSerial");
    background(100);
    fill(255,255,255);
    textAlign(LEFT);
    text("Serial connected", 20, 60);
    
    set_button_texts();
    serial = new Serial(this, Serial.list()[portNumber], Integer.parseInt(baudrates[selectedBaudrate]));
    connectedSerial = true;
    serial.bufferUntil('\n');
    serial.write("G;"); // Go
  }
  else if (portNumber == -1)
    println("Select COM Port first!");
  else if (selectedBaudrate == -1)
    println("Select baudrate first!");
  else if (connectedSerial)
    println("Already connected to a port!");
}

void Disconnect(int theValue)
{
  if (connectedSerial)//Check if there is a connection established
  {
    serial.stop();
    serial = null;
    connectedSerial = false;
    background(0); // background color change by Kevin
    set_button_texts();
    fill(255,255,255);
    text("Serial disconnected", 80, 60);
    println("Serial disconnected");
  }
  else
    println("Couldn't disconnect");
}


void createModalDialog(String message) {
    messageBoxResult = JOptionPane.showConfirmDialog(frame, message);
}

public void One_shot() { //One shot
  if(connectedSerial){
    serial.write('x');
    println("type 'x'");
    status_text("One shot");
  }
  isPressedCh2Button = !isPressedCh2Button;
       messageBoxResult = -1;
}

public void Bulb_on() { //Bulb shot start
  if(connectedSerial){
    serial.write('w');
    println("type 'w'");
    status_text("Bulb shot on");
  }
  isPressedCh2Button = !isPressedCh2Button;
     messageBoxResult = -1;
}
public void Bulb_off() { //Bulb shot stop
  if(connectedSerial){
    serial.write('s');
    println("type 's'");
    status_text("Bulb shot off");
  }
  isPressedCh2Button = !isPressedCh2Button;
     messageBoxResult = -1;
}


/*
public void auto_on() {
int hh = hour();
int mm= minute();
int ss = second();

int mms=millis();
  if (isPressedautoButton && connectedSerial && start_hh==hh && start_mm==mm && start_ss==ss )  
        {
        ch6_on();
        }
    if(isPressedautoButton && connectedSerial && start_hh==hh-3 && start_mm == mm && start_ss == ss )  
       {
        ch7_on();
      }
    if (isPressedautoButton && connectedSerial && (ss%15==0))
    {
      One_shot();
  } else if (!isPressedautoButton && connectedSerial) {
  
  }
  isPressedautoButton = !isPressedautoButton;
       messageBoxResult = -1;
}

public void auto_off() {
  createModalDialog("auto off");
   if (messageBoxResult >= 1)
    return;
  if (isPressedautoButton && connectedSerial) {
  } else if (!isPressedautoButton && connectedSerial) {
  }
  isPressedautoButton = !isPressedautoButton;
       messageBoxResult = -1;
}
*/


int previous_ss;

void draw(){
  int y = year();
  int m = month();
  int d = day();
  int hh = hour();
  int mm = minute();
  int ss = second();
  beattime(hh, mm, ss);
}

void beattime(int hh, int mm, int ss){
  fill(255);
  rect(275,70,180,20);
  fill(0);
  textFont(f,20);
  textAlign(LEFT);
  textSize(13);
  text("Com Clock        " + hh + " : " + mm + " : " + ss, 285, 85);
  fill(255);
  rect(275,95,180,20);
  rect(275,120,180,20);
  fill(0);
  textFont(f,20);
  textAlign(LEFT);
  textSize(13);
  text("Roof Open time    " + ROpen_hh  + " : " + ROpen_mm  + " : " + ROpen_ss,  285, 110);
  text("Roof Close time   " + RClose_hh + " : " + RClose_mm + " : " + RClose_ss, 285, 135);
  
  if(connectedSerial){
    if (ROpen_hh==hh && ROpen_mm==mm && ROpen_ss==ss ) {
      ch6_on(); //open
    }
    if (RClose_hh==hh-3 && RClose_mm == mm && RClose_ss == ss ) {
      ch7_on();  //close
    }
    if (ss==0 || ss==15 || ss==30 || ss==45) {
      if(previous_ss != ss){
        One_shot();
        println(ss);
      }
    } else if (!isPressedautoButton) {
    
    }
  }
  previous_ss = ss;
}