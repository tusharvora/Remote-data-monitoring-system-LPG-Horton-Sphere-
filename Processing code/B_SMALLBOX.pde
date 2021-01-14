void smallBox(float smallBoxNo, String boxHead11, String boxHead12, int status) {
  
  float yLen = 0.78*height;
  float xLen = (width-((noOfArea+1)*intBoxDist))/noOfArea;
  float smallBoxSpacing = 0.21*yLen;
  
  float yLenSmall = 0.08*yLen;
  float xLenSmall = 0.8*xLen;
  float r = 0.01*xLenSmall;
  
  float XlenStartSmall = (xLen-xLenSmall)/2;
  float YLenStartSmall = 0.24*yLen + (smallBoxNo-1)*smallBoxSpacing;
  

  pushMatrix();
  translate(XlenStartSmall,YLenStartSmall);
  
  textSize(yLenSmall*0.65);
  //fill(#B9FFFE);textAlign(CENTER);
  fill(#FFFFFF);textAlign(CENTER);
  text(boxHead11, xLenSmall/2.0,0);
  textSize(yLenSmall*0.45);
  text(boxHead12, xLenSmall/2.0,0.44*yLenSmall);
  
  rectMode(CORNER);  // Set rectMode to CORNERS
  strokeWeight(height*0.001); stroke(#C1FDFF);
  float textXpos = xLenSmall/2.0;
  float textYpos = 1.37*yLenSmall;
  textSize(yLenSmall*0.7);
  
  if (status == 0){
          fill(#00AF1E);     // Set fill to green
          rect(0, 0.6*yLenSmall, xLenSmall, yLenSmall,r);  // Draw gray rect using CORNERS mode
          fill(#FFFFFF);textAlign(CENTER);  // Set fill to green
          text("CLOSED", textXpos,textYpos);
      }
      else if(status == 1){
          fill(#FF8400);  // Set fill to orange
          rect(0, 0.6*yLenSmall, xLenSmall, yLenSmall,r);  // Draw gray rect using CORNERS mode
          fill(#FFFFFF);textAlign(CENTER);  // Set fill to green
          text("MID POS", textXpos,textYpos);
      }
      else if(status == 2){
          fill(#FA0808);  // Set fill to red
          rect(0, 0.6*yLenSmall, xLenSmall, yLenSmall,r);  // Draw gray rect using CORNERS mode
          fill(#FFFFFF);textAlign(CENTER);  // Set fill to green
          text("OPEN", textXpos,textYpos);
      }
      else if(status == 3){
          fill(#FFF300);  // Set fill to red
          rect(0, 0.6*yLenSmall, xLenSmall, yLenSmall,r);  // Draw gray rect using CORNERS mode
          fill(#FF0009);textAlign(CENTER);  // Set fill to green
          text("ERROR", textXpos,textYpos);
      }
      else if(status == 4){
          fill(10);  // Set fill to red
          rect(0, 0.6*yLenSmall, xLenSmall, yLenSmall,r);  // Draw gray rect using CORNERS mode
      }
      
  
  popMatrix();

  }