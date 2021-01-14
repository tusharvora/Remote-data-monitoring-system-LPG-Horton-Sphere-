    int interfaceSelection() {
  
    float xLen = (width-((noOfArea+1)*intBoxDist))/noOfArea;
    float yLen = 0.81*height;
    float yClearance = 0.16*height;
    int screenRef=0;
    
    
    for (int i=0; i<noOfArea; i=i+1){
       if((mouseX > (i+1)*intBoxDist+(i*xLen) && mouseX < (i+1)*intBoxDist+((i+1)*xLen)) &&                           // decide which screen to show screen 1 or screen 2
          (mouseY > yClearance && mouseY < yClearance+yLen) && mousePressed && screenId == 1){
          screenRef = i+1;
        }
          else if ((mouseX > intBoxDist && mouseX < (noOfArea)*(intBoxDist+xLen)) &&                           // decide which screen to show screen 1 or screen 2
          (mouseY > 0 && mouseY < yClearance) && mousePressed && screenId != 1){
            screenRef=int(noOfArea)+1;
          }
        }
          
          if (screenRef == 1) screenId = 2;
          else if (screenRef == 2) screenId = 2;
          else if (screenRef == 3) screenId = 2;
          else if (screenRef == 4) screenId = 3;
          else if (screenRef == 5) screenId = 3;
          else if (screenRef == 6) screenId = 3;
          else if (screenRef == 7) screenId = 1;
          
       return (screenId);
  }
    
    
 
  