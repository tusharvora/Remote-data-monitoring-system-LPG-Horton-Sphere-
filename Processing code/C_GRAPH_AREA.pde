void drawGraphArea(float boxCount, int noOfRov, String head1, int rov1, String rovTag1, int rov2, String rovTag2, int rov3,String rovTag3, int rov4,String rovTag4, int[][] a){
  
  float yClearance = 0.15*height; // clearance height before the first big box is drawn
  float xLen = width-(2*intBoxDist); // length of one big graph
  float yLen = (height-(((noOfGraph+1)*intGraphDist)+yClearance))/noOfGraph; // height of one big graph
  float r = 0.000*width;
  
  
  float x = intBoxDist;
  float y = (boxCount*intGraphDist)+(boxCount-1)*yLen+(yClearance);
  
  float x1 = 0.1*xLen; // origing of the graph drawn inside the box
  float y1 = 0.8*yLen; // origing of the graph drawn inside the box
  float xGraph = 0.87*xLen; // length of the graph area inside the box
  float yGraph = 0.7*yLen; // height of the graph area inside the box
  

  
  
  pushMatrix();
  translate(x,y);
  
 //----------------------------------------------------------------------
 // DRAWING THE BIGGER BOX 
 //----------------------------------------------------------------------
  rectMode(CORNER);
  strokeWeight(height*0.002); stroke(#C1FDFF);
  fill(10);  // Set fill to gray
  rect(0, 0, xLen, yLen,r);  // Draw gray rect using CORNERS mode
  
  textSize(width*0.015);
  fill(#FFFFA6);textAlign(CENTER,BOTTOM);
  pushMatrix();
  translate(0.03*xLen,yLen/2.0);
  rotate(-HALF_PI);
  text(head1, 0,0);
  popMatrix();

  //-----------------------------------------------------------------------------
  // DRAWING THE GRAPH AREA
  //------------------------------------------------------------------------------
  pushMatrix();
  translate(x1,y1);  // x1, y1 are the coordinates of the lower left corner of the graph area
  
  rectMode(CORNER);
  strokeWeight(height*0.0005); stroke(#C1FDFF);
  fill(10);  // Set fill to gray
  rect(0, 0, xGraph, -yGraph,r);  // Draw gray rect using CORNERS mode
  strokeWeight(height*0.003);
  line(0,0,xGraph,0);               // X-Axis line 
  line(0,0,0,-yGraph);              // y-Axis line
  
 
  
    rovGraph(1,noOfRov,rov1,rovTag1,xGraph,yGraph,a);
    rovGraph(2,noOfRov,rov2,rovTag2,xGraph,yGraph,a);
    rovGraph(3,noOfRov,rov3,rovTag3,xGraph,yGraph,a);
    rovGraph(4,noOfRov,rov4,rovTag4,xGraph,yGraph,a);
 
   for (int i = 0; i < totalHr+1; i = i+1){    
    strokeWeight(height*0.0003); stroke(#C1FDFF);
    line(i*(xGraph/totalHr),0,i*(xGraph/totalHr),-yGraph);  //drawing vertical grid lines
    
    textSize(width*0.010);
    fill(#FFFFA6);textAlign(CENTER,BOTTOM);  
    text(i+startHr, i*(xGraph/totalHr),(yLen-y1)*0.5*(yLen/yGraph));  //drawing x-tick labels
  }
  
  
  popMatrix(); 
  popMatrix();

   



}