void set_buttons(){
 
  cp5.addButton("ch1_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0)
    .setSize(80,20)
    //.setVisible(!isCh1)
    ;
  cp5.addButton("ch1_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0)
    .setSize(80,20)
    //.setVisible(isCh1)
    ;
  cp5.addToggle("on/off1")
   .setPosition(ch_button_x0+ch_button_w*2,ch_button_y0)
   .setSize(50,20)
   .setValue(true)
   .setMode(ControlP5.SWITCH)
   .lock()
   ;
  cp5.addButton("Bulb_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0+ch_button_h*1)
    .setSize(80,20)
    ;
  cp5.addButton("Bulb_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*1)
    .setSize(80,20)
    ;
  cp5.addButton("One_shot")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0+ch_button_h*1+25)
    .setSize(80,20)
    ;
  /*
  cp5.addButton("ch3_on")
    .setPosition(ch_button_x0,ch_button_y0+ch_button_h*2)
    .setSize(80,20)
    ;
  cp5.addButton("ch3_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*2)
    .setSize(80,20)
    ;
  */
  cp5.addButton("ch4_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0+ch_button_h*3)
    .setSize(80,20)
    ;
  cp5.addButton("ch4_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*3)
    .setSize(80,20)
    ;
  cp5.addButton("ch5_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0+ch_button_h*4)
    .setSize(80,20)
    ;
  cp5.addButton("ch5_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*4)
    .setSize(80,20)
    ;
  cp5.addButton("ch6_on")
    .setPosition(ch_button_x0+250+ch_button_w*0,ch_button_y0+ch_button_h*0+22)
    .setSize(80,20)
    ;
  cp5.addButton("ch7_on")
    .setPosition(ch_button_x0+250+ch_button_w*1,ch_button_y0+ch_button_h*0+22)
    .setSize(80,20)
    ;
  cp5.addButton("ch8_on")
    .setPosition(ch_button_x0+250+ch_button_w*2,ch_button_y0+ch_button_h*0+22)
    .setSize(80,20)
    ;
  cp5.addButton("auto_on")
    .setPosition(ch_button_x0+260+ch_button_w*0,ch_button_y0+ch_button_h*3)
    .setSize(80,20)
    ;
  cp5.addButton("auto_off")
    .setPosition(ch_button_x0+260+ch_button_w*1,ch_button_y0+ch_button_h*3)
    .setSize(80,20)
    ;
  set_button_texts();
}
void set_button_texts(){
  textSize(14);
  text("Anallemma Camera Power control", 20, ch_button_y0+ch_button_h*0-10);
  text("Anallemma Camera Shutter", 20, ch_button_y0+ch_button_h*1-10);
  text("Astronomical CCD Power control", 20, ch_button_y0+ch_button_h*3-10);
  text("Motor focuser Power control", 20, ch_button_y0+ch_button_h*4-10);
  text("Roof control", 272+ch_button_w*0, ch_button_y0+ch_button_h*0-10);
  text("Open", 290+ch_button_w*0, ch_button_y0+ch_button_h*0+15);
  text("Close", 290+ch_button_w*1, ch_button_y0+ch_button_h*0+15);
  text("Stop", 290+ch_button_w*2, ch_button_y0+ch_button_h*0+15);
  text("Anallemma Automation", 272+ch_button_w*0, ch_button_y0+ch_button_h*3-10);
}