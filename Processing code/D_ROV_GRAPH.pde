void rovGraph(int rovGraphNo, int noOfRov, int rovNo, String rovTag, float xGraph, float yGraph, int[][] a) {
    
  float ySecLen = yGraph/noOfRov; // height of yGraph taken for representing a single rov
  float yBarHeight = ySecLen*0.7; // height of the bars that is drawn
  
  
  int[] data = new int[1440];

 
  if(rovNo != 0){
    
    pushMatrix();
    translate(0,-((rovGraphNo-1)*ySecLen+(0.5*ySecLen)));
    
    int rov = rovNo % 100;
    for (int i=0; i<1440; i=i+1){
      data[i] = a[rov][i];
      
      strokeWeight(width*0.0003);
      
      if (data[i]==0)stroke(#00AF1E);         //closed GREEN
      else if (data[i]==1)stroke(#FF8400);    //mid position ORANGE
      else if (data[i]==2)stroke(#FA0808);    //open RED
      else if (data[i]==3)stroke(#FFF300);    //error YELLOW
      else if (data[i]==9)stroke(50);    //default no data
      
      line(i*xGraph/1440,-yBarHeight/2,i*xGraph/1440,yBarHeight/2);
      
      }
      textSize(width*0.01);
      fill(#FFFFA6);textAlign(CENTER,CENTER);
      text("ROV-"+(rov+100), -xGraph*0.04,0);
      fill(#FFFFA6);textAlign(LEFT,CENTER);
      text(rovTag, xGraph*0.03,0);
       popMatrix();
    }
    else{
    }

}