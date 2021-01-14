color screen1Background= #2F2933;
color siragaColor=#F8CA4D;

//float height = 768;
//float width = 1366;

//float height = 720;
//float width = 1280;

float height = 760;
float width = 1365;


//float height = 650   ;
//float width = 1300;

int screenId = 1;

float noOfArea = 6;
float intBoxDist = 0.015*width;

float noOfGraph = 3;
float intGraphDist = 0.03*height;

String[] dataDumpStr = new String[1440];
int[][] dataDumpInt = new int[20][1440];  // int[col][rows]
int lastDump = 0;
int dumpInterval = 10000;
int lastDraw = 0;
int drawInterval = 5000;

int startHr = 0;
int stopHr = 24;
int totalHr = stopHr-startHr;

int rov101 = 1;
int rov102 = 1;
int rov103 = 1;
int rov104 = 1;
int rov105 = 1;
int rov106 = 1;
int rov107 = 1;
int rov108 = 1;
int rov109 = 1;
int rov110 = 1;
int rov111 = 1;
int rov112 = 1;
int rov113 = 1;
int rov114 = 1;
int rov115 = 1;
int rov116 = 1;
int rov117 = 1;
int rov118 = 1;
int rov119 = 1;
int spare1 = 4;

import processing.serial.*;
Serial myPort;

import processing.pdf.*;
boolean record;

int[] value = new int[6];
int seq = 10;
int r1 = 1;
int r2 = 1;
int r3 = 1;
int r4 = 1;
int r5 = 1;





void setup() {
  //size(1280, 720);
  size(1365, 760);
  //fullScreen(); 
  smooth();
  myPort = new Serial(this, Serial.list()[2], 9600);
  //myPort = new Serial(this, Serial.list()[12], 9600);
    
  //String fileAddress = "C:/Users/Soumyatattwa/Desktop/processing-3.0.1/sketches/ROV_INDICATION_2_PI/rov_data/"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "rov_data" + ".txt";
  String fileAddress = "/home/pi/sketchbook/sketches/ROV_INDICATION_2_PI/rov_data/"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "rov_data" + ".txt";
  File f1 = new File(fileAddress);
     
     
         if (f1.exists() ){
             //println("exist");
                    
                 String dataDumpStr[] = loadStrings(fileAddress);
                 int dataDumpLen = dataDumpStr.length;    
                     if (dataDumpLen != 0 ){  
                            
                       for (int i = 0; i < 1440; i = i+1) {
                           int[] timeFrameValue =new int [20];
                           timeFrameValue = int(trim(split(dataDumpStr[i],',')));
                         for (int j = 0; j < 20; j = j+1)
                                   dataDumpInt[j][i] = timeFrameValue[j];  // dataDumpInt[col][row]
                               }
                             }
                           }
                       else{
                         for (int i = 0; i < 1440; i = i+1) {
                           for (int j = 0; j < 20; j = j+1) {                          
                               if(j == 0) dataDumpInt[j][i] = i;
                               else dataDumpInt[j][i] = 9;
                              }
                            }
                          } 
                              
}

void serialEvent(Serial p) { 
 // get message till line break (ASCII > 13)
 String message = myPort.readStringUntil(13);
 if(message != null){
   value = int(trim(split(message,',')));
 }
}




void draw() {
  
  //String fileAddress = "C:/Users/Soumyatattwa/Desktop/processing-3.0.1/sketches/ROV_INDICATION_2_PI/rov_data/"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "rov_data" + ".txt";
  String fileAddress = "/home/pi/sketchbook/sketches/ROV_INDICATION_2_PI/rov_data/"+nf(year(),4,0) + "_" + nf(month(),2,0)+ "_" + nf(day(),2,0)+ "_" + "rov_data" + ".txt";
  //---------------------------------------
  // SETTING DATE AND TIME
  //---------------------------------------
  int hour = hour();
  int min = minute();
  int sec = second();
  int trackMin = hour*60+min;
  
  int day = day();
  int month = month();
  int year = year();
  
   if(hour==00 && min==00 && sec==01){               // all value of production is reset at the start of new day
       for (int i = 0; i < 1440; i = i+1) {
           for (int j = 0; j < 20; j = j+1) {                          
                  dataDumpInt[j][i] = 9;
              }
            }
       } 


   int seq = value[0];
   int r1 = value[1];
   int r2 = value[2];
   int r3 = value[3];
   int r4 = value[4];
   int r5 = value[5];
   
   
   
   
   if (seq == 10){
     rov101 = r1; dataDumpInt[1][trackMin]=r1;
     rov102 = r2; dataDumpInt[2][trackMin]=r2;
     rov103 = r3; dataDumpInt[3][trackMin]=r3;
     rov104 = r4; dataDumpInt[4][trackMin]=r4;
     rov105 = r5; dataDumpInt[5][trackMin]=r5;
   } 
   else if (seq == 20){
     rov106 = r1; dataDumpInt[6][trackMin]=r1;
     rov107 = r2; dataDumpInt[7][trackMin]=r2;
     rov108 = r3; dataDumpInt[8][trackMin]=r3;
     rov109 = r4; dataDumpInt[9][trackMin]=r4;
     rov110 = r5; dataDumpInt[10][trackMin]=r5;
   }
   else if (seq == 30){
     rov111 = r1; dataDumpInt[11][trackMin]=r1;
     rov112 = r2; dataDumpInt[12][trackMin]=r2;
     rov113 = r3; dataDumpInt[13][trackMin]=r3;
     rov114 = r4; dataDumpInt[14][trackMin]=r4;
     rov115 = r5; dataDumpInt[15][trackMin]=r5;
   }
   else if (seq == 40){
     rov116 = r1; dataDumpInt[16][trackMin]=r1;
     rov117 = r2; dataDumpInt[17][trackMin]=r2;
     rov118 = r3; dataDumpInt[18][trackMin]=r3;
     rov119 = r4; dataDumpInt[19][trackMin]=r4;
   }
   else if (seq == 50){
   } 
    
    int pdfHr = 23;
    int pdfMin = 59;
     if(hour==pdfHr && min==pdfMin && sec==00){
          screenId = 3;
          beginRecord(PDF, fileAddress + "screen_2" + ".pdf");
        }
        
      if(hour==pdfHr && min==pdfMin && sec==03){
        screenId = 2;
        beginRecord(PDF, fileAddress + "screen_1" + ".pdf");
      }
      
        if(hour==pdfHr && min==pdfMin && sec==06){
        screenId = 1;
      }
    
    
    background(screen1Background);
    PFont myFont;
    myFont = createFont ("CordiaUPC Bold",100);
    textFont(myFont);
    
    
    fill(siragaColor);
    textSize(width*0.010);
    textAlign(LEFT,CENTER);
    text(int(seq) + "_"+ int(r1) + "_" + int(r2) + "_" + int(r3) + "_" + int(r4) + "_" + int(r5) + "   " + screenId, width*0.001, height*0.99);
    
    fill(siragaColor);
    textSize(width*0.04);
    textAlign(CENTER);
    text("ROV MONITORING SYSTEM" + "  " + nf(day,2) + "." + nf(month,2) + "." +nf(year,4), width*0.5, height*0.12);
    
    //----------------------------------------------
    // INTERFACE SELECTION
    //----------------------------------------------
    
    screenId = interfaceSelection();
    //screenId = 1;
    if (screenId == 1){
//=================================================================================================
//=================================================================================================
// SCREEN 1
//=================================================================================================
//=================================================================================================
    //drawCustom(boxCount, head1, head2, boxHead11, boxHead12, status1, boxHead21, boxHead22, status2, boxHead31, boxHead32, status3, boxHead41, boxHead42, status4);
    //boxCount = box numbering from left side
    //head1 = main heading in the box (line 1)
    //head2 = main heading in the box (line 2)
    drawCustom(1,"SPHERE","NO - 1","ROV 101", "LIQUID LINE", rov101, "ROV 104", "VAP DISCHARGE", rov104, "ROV 107", "VAP SUCTION", rov107, "", "", spare1);
    drawCustom(2,"SPHERE","NO - 2","ROV 102", "LIQUID LINE", rov102, "ROV 105", "VAP DISCHARGE", rov105, "ROV 108", "VAP SUCTION", rov108, "", "", spare1);
    drawCustom(3,"SPHERE","NO - 3","ROV 103", "LIQUID LINE", rov103, "ROV 106", "VAP DISCHARGE", rov106, "ROV 109", "VAP SUCTION", rov109, "", "", spare1);
    drawCustom(4,"SPHERE","NO - 4","ROV 110", "LIQUID LINE", rov110, "ROV 111", "VAP DISCHARGE", rov111, "ROV 112", "VAP SUCTION", rov112, "", "", spare1);
    drawCustom(5,"TANK","WAGON","ROV 117", "LIQUID LINE", rov117, "ROV 118", "VAP SUC/DIS", rov118, "ROV 119", "VAP SUC/DIS", rov119, "", "", spare1);
    drawCustom(6,"TANK","LORRY","ROV 113", "LIQ DECANT", rov113, "ROV 114", "LIQ FILLING", rov114, "ROV 115", "VAP SUC/DIS", rov115, "ROV 116", "VAP SUC/DIS", rov116);
    }
    
    

//=================================================================================================
// SCREEN 2
//=================================================================================================
    else if (screenId == 2){
        drawGraphArea(1,3,"SP01",101,"SP01 LIQUID", 104,"SP01 DISCHARGE", 107,"SP01 SUCTION", 0,"", dataDumpInt);
        drawGraphArea(2,3,"SP02",102,"SP02 LIQUID", 105,"SP02 DISCHARGE", 108,"SP02 SUCTION", 0,"", dataDumpInt);
        drawGraphArea(3,3,"SP03",103,"SP03 LIQUID", 106,"SP03 DISCHARGE", 109,"SP03 SUCTION", 0,"", dataDumpInt);
    }

//=================================================================================================
// SCREEN 3
//=================================================================================================
    else if (screenId == 3){
        drawGraphArea(1,3,"SP04",110,"SP04 LIQUID", 111,"SP04 DISCHARGE", 112,"SP04 SUCTION", 0,"", dataDumpInt);
        drawGraphArea(2,3,"T/W", 117,"T/W LIQUID", 118,"T/W VAP SUC/DIS", 119,"T/W VAP SUC/DIS", 0,"", dataDumpInt);
        drawGraphArea(3,4,"T/L", 113,"T/L LIQ DEC", 114,"T/L LIQ FIL", 115,"T/L VAP SUC/DIS", 116,"T/L VAP SUC/DIS", dataDumpInt);
    }
    
////=================================================================================================
//// SCREEN 4
////=================================================================================================
//    else if (screenId == 4){
//    drawGraphArea(1,3,"TANK WAGON", 117,"T/W LIQUID", 118,"T/W VAP SUC/DIS", 119,"T/W VAP SUC/DIS", 0,"", dataDumpInt);
//    drawGraphArea(2,4,"TANK LORRY", 113,"T/L LIQ DEC", 114,"T/L LIQ FIL", 115,"T/L VAP SUC/DIS", 116,"T/L VAP SUC/DIS", dataDumpInt);
//    }  
   
       if (millis()-lastDump >= dumpInterval) {         // data dumping
       
         for (int i=0; i<1440; i=i+1){
             dataDumpStr[i] = dataDumpInt[0][i]+","+dataDumpInt[1][i]+","+dataDumpInt[2][i]+","+dataDumpInt[3][i]+","+dataDumpInt[4][i]+","
                             +dataDumpInt[5][i]+","+dataDumpInt[6][i]+","+dataDumpInt[7][i]+","+dataDumpInt[8][i]+","+dataDumpInt[9][i]+","
                             +dataDumpInt[10][i]+","+dataDumpInt[11][i]+","+dataDumpInt[12][i]+","+dataDumpInt[13][i]+","+dataDumpInt[14][i]+","
                             +dataDumpInt[15][i]+","+dataDumpInt[16][i]+","+dataDumpInt[17][i]+","+dataDumpInt[18][i]+","+dataDumpInt[19][i];
                              }
                              
      saveStrings(fileAddress, dataDumpStr);
      
      lastDump = millis();
      } 
      
      
      endRecord();
    
    
}