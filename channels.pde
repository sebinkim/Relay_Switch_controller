public void ch1_on() {
  if (isPressedCh1Button && connectedSerial) {
    serial.write('q'); println("type 'q'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch1 on", status_text_x, status_text_y);
  } else if (!isPressedCh1Button && connectedSerial) {
    serial.write('q'); println("type 'q'");    
  fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch1 on", status_text_x, status_text_y);
  }
  isPressedCh1Button = !isPressedCh1Button;
    ((Toggle)cp5.getController("on1/off1")).setState(true);
      messageBoxResult = -1;
}

public void ch1_off() {
  createModalDialog("Ch1 off");
  if (messageBoxResult >= 1)
    return;
  if (isPressedCh1Button && connectedSerial) {
    serial.write('a'); println("type 'a'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch1 off", status_text_x, status_text_y);
  } else if (!isPressedCh1Button && connectedSerial) {
    serial.write('a'); println("type 'a'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch1 off", status_text_x, status_text_y);
  }
  isPressedCh1Button = !isPressedCh1Button;
    ((Toggle)cp5.getController("on1/off1")).setState(false);
      messageBoxResult = -1;
}

/* 
public void ch2_on() { 
  if (isPressedCh2Button && connectedSerial) {
    serial.write('w'); println("type 'w'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch2 on", status_text_x, status_text_y);
  } else if (!isPressedCh2Button && connectedSerial) {
    serial.write('w'); println("type 'w'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch2 on", status_text_x, status_text_y);
  }
  isPressedCh2Button = !isPressedCh2Button;
  ((Toggle)cp5.getController("on2/off2")).setState(true);
     messageBoxResult = -1;
}


public void ch2_off() {
  createModalDialog("ch2 off");
  if (messageBoxResult >= 1)
    return;
  if (isPressedCh2Button && connectedSerial) {
    serial.write('s');
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch2 off", status_text_x, status_text_y);
  } else if (!isPressedCh2Button && connectedSerial) {
    serial.write('s');
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch2 off", status_text_x, status_text_y);
  }
  isPressedCh2Button = !isPressedCh2Button;
    ((Toggle)cp5.getController("on2/off2")).setState(false);
   
   messageBoxResult = -1;
}   
*/


public void ch3_on() {
  if (isPressedCh3Button && connectedSerial) {
    serial.write('e');
    textSize(11); text("Ch3 on", status_text_x, status_text_y);
  } else if (!isPressedCh3Button && connectedSerial) {
    serial.write('e');
  }
  isPressedCh3Button = !isPressedCh3Button;
  textSize(11); text("Ch3 on", status_text_x, status_text_y);
    ((Toggle)cp5.getController("on3/off3")).setState(true);
       messageBoxResult = -1;
}

public void ch3_off() {
  createModalDialog("Ch3 off");
   if (messageBoxResult >= 1)
    return;
  if (isPressedCh3Button && connectedSerial) {
    serial.write('d'); println("type 'd'");
    textSize(11); text("Ch3 off", status_text_x, status_text_y);
  } else if (!isPressedCh3Button && connectedSerial) {
    serial.write('d'); println("type 'd'");
    textSize(11); text("Ch3 off", status_text_x, status_text_y);
  }
  isPressedCh3Button = !isPressedCh3Button;
    ((Toggle)cp5.getController("on3/off3")).setState(false);
       messageBoxResult = -1;
}

public void ch4_on() {
  if (isPressedCh4Button && connectedSerial) {
    serial.write('r'); println("type 'r'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch4 on", status_text_x, status_text_y);
  } else if (!isPressedCh4Button && connectedSerial) {
    serial.write('r'); println("type 'r'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch4 on", status_text_x, status_text_y);
  }
  isPressedCh4Button = !isPressedCh4Button;
    ((Toggle)cp5.getController("on4/off4")).setState(true);
       messageBoxResult = -1;
}

public void ch4_off() {
  createModalDialog("Ch4 off");
   if (messageBoxResult >= 1)
    return;
  if (isPressedCh4Button && connectedSerial) {
    serial.write('f'); println("type 'f'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch4 off", status_text_x, status_text_y);
  } else if (!isPressedCh4Button && connectedSerial) {
    serial.write('f'); println("type 'f'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch4 off", status_text_x, status_text_y);
  }
  isPressedCh4Button = !isPressedCh4Button;
    ((Toggle)cp5.getController("on4/off4")).setState(false);
       messageBoxResult = -1;
}

public void ch5_on() {
  if (isPressedCh5Button && connectedSerial) {
    serial.write('t'); println("type 't'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch5 on", status_text_x, status_text_y);
  } else if (!isPressedCh5Button && connectedSerial) {
    serial.write('t'); println("type 't'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch5 on", status_text_x, status_text_y);
  }
  isPressedCh5Button = !isPressedCh5Button;
    ((Toggle)cp5.getController("on5/off5")).setState(true);
       messageBoxResult = -1;
}

public void ch5_off() {
  createModalDialog("Ch5 off");
  if (messageBoxResult >= 1)
    return;
  if (isPressedCh5Button && connectedSerial) {
    serial.write('g'); println("type 'g'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch5 off", status_text_x, status_text_y);
  } else if (!isPressedCh5Button && connectedSerial) {
    serial.write('g'); println("type 'g'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Ch5 off", status_text_x, status_text_y);
  }
  isPressedCh5Button = !isPressedCh5Button;
    ((Toggle)cp5.getController("on5/off5")).setState(false);
       messageBoxResult = -1;
}
public void ch6_on() {
  if (connectedSerial) {
    serial.write('y'); println("type 'y'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Roof open", status_text_x, status_text_y);
  }
}
public void ch7_on() {
  if (connectedSerial) {
    serial.write('u'); println("type 'u'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Roof close", status_text_x, status_text_y);
  }
}

public void ch8_on() {
  if (connectedSerial) {
    serial.write('i'); println("type 'i'");
    fill(255); textSize(11); rect(status_text_x-50,15,100,25); fill(0); text("Roof stop", status_text_x, status_text_y);
  }
}