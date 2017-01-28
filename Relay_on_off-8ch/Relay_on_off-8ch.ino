int relayPin1 = 5;
int relayPin2 = 6;
int relayPin3 = 7;
int relayPin4 = 8;
int relayPin5 = 9;
int relayPin6 = 10;
int relayPin7 = 11;
int relayPin8 = 12;

int statusPin1 = 0;
int statusPin2 = 0;
int statusPin3 = 0;
int statusPin4 = 0;
int statusPin5 = 0;
int statusPin6 = 0;
int statusPin7 = 0;
int statusPin8 = 0;
int delayTime = 100;

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
  pinMode(relayPin1, OUTPUT);
  pinMode(relayPin2, OUTPUT);
  pinMode(relayPin3, OUTPUT);
  pinMode(relayPin4, OUTPUT);
  pinMode(relayPin5, OUTPUT);
  pinMode(relayPin6, OUTPUT);
  pinMode(relayPin7, OUTPUT);
  pinMode(relayPin8, OUTPUT);
}
void loop() 
{
while(!Serial.available()); //시리얼로 데이터 들어올 때까지 대기
char com = Serial.read(); //들어온 데이터를 변수 com에 저장
Serial.print(com);
switch(com) {
   case 'q':
   digitalWrite(5, 1) ;  statusPin1 = 1;
   delay(100);
   break;
   case 'a':
   digitalWrite(5, 0) ;  statusPin1 = 0;
   delay(100);
   break;
   case 'w':
   digitalWrite(6, 1) ;   statusPin2 = 1;
   delay(100);
   break;
   case 's':
   digitalWrite(6, 0) ;  statusPin2 = 0;
   delay(5);
   break;
   case 'x':
   digitalWrite(6, 1) ;   statusPin2 = 1;
   delay(100);
   digitalWrite(6, 0) ;   statusPin2 = 0;
   delay(100);
   break;
   case 'e':
   digitalWrite(7, 1) ;   statusPin3 = 1;
   delay(100);
   break;
   case 'd':
   digitalWrite(7, 0) ; statusPin3 = 0;
   delay(100);
   break;
   case 'r':
   digitalWrite(8, 1) ;   statusPin4 = 1;
   delay(100);
   break;
   case 'f':
   digitalWrite(8, 0) ;  statusPin4 = 0;
   delay(100);
   break;

   case 't':
   digitalWrite(9, 1) ;   statusPin5 = 1;
   delay(100);
   break;
   case 'g':
   digitalWrite(9, 0) ;  statusPin5 = 0;
   delay(100);
   break;
   case 'y':
   digitalWrite(10, 1) ;   statusPin6 = 1;
   delay(100);
   digitalWrite(10, 0) ;  statusPin6 = 0;
   delay(10);
   break;
   case 'h':
   digitalWrite(10, 0) ; statusPin6 = 0;
   delay(100);
   break;
   case 'u':
   digitalWrite(11, 1) ;   statusPin7 = 1;
   delay(100);
   digitalWrite(11, 0) ;  statusPin7 = 0;
   delay(10);
   break;
   case 'j':
   digitalWrite(11, 0) ;  statusPin7 = 0;
   delay(100);
   break;
   case 'i':
   digitalWrite(12, 1) ; statusPin8 = 1;
   delay(500);
   digitalWrite(12, 0) ; statusPin8 = 0;
   delay(10);
   break;
   case 'k':
   digitalWrite(12, 0) ; statusPin8 = 0;
   delay(500);
   break;
}
Serial.print(statusPin1);
Serial.print(statusPin2);
Serial.print(statusPin3);
Serial.print(statusPin4);
Serial.print(statusPin5);
Serial.print(statusPin6);
Serial.print(statusPin7);
Serial.print(statusPin8);
Serial.println("");
}


