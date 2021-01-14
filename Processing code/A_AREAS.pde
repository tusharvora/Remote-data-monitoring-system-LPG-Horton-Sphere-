  void drawCustom(float boxCount, String head1, String head2, String boxHead11, String boxHead12, int status1, String boxHead21, String boxHead22, int status2, String boxHead31, String boxHead32, int status3, String boxHead41, String boxHead42, int status4) {
  //void drawCustom(float boxCount, String head1, String head2) {
    
  float xLen = (width-((noOfArea+1)*intBoxDist))/noOfArea; // length of one big box like "sphere 1"
  //float yLen = 0.81*height;
  float yLen = 0.81*height; // height of one big box ""           
  float r = 0.007*width;
  
  float x = (boxCount*intBoxDist)+(boxCount-1)*xLen;
  float y = 0.16*height;

  
  pushMatrix();
  translate(x,y);
  
  rectMode(CORNER);  // Set rectMode to CORNERS
  strokeWeight(height*0.006); stroke(#C1FDFF);
  fill(10);  // Set fill to gray
  rect(0, 0, xLen, yLen,r);  // Draw gray rect using CORNERS mode
  
  textSize(width*0.03);
  fill(#FFFFA6);textAlign(CENTER);
  text(head1, xLen/2.0,0.08*yLen);
  text(head2, xLen/2.0,0.14*yLen);
  
  
  smallBox(1,boxHead11, boxHead12, status1);
  smallBox(2,boxHead21, boxHead22, status2);
  smallBox(3,boxHead31, boxHead32, status3);
  smallBox(4,boxHead41, boxHead42, status4);
  
  
  popMatrix();
  }