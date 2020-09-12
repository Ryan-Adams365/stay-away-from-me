import 'package:flutter/material.dart';


/*
  Function: getPaddingAmount
  Description: Returns padding amount based on screen size * the factor. Can 
    base the padding off of either the height or the width using the 'usingWidth'
    flag.
*/
double getPaddingAmount(BuildContext context, double factor, bool usingWidth) {
    final Size screenSize = MediaQuery.of(context).size;
    double padding;
    usingWidth ? padding = screenSize.width * factor : padding = screenSize.height * factor;  
    return padding;
} 

// function stub
int getNumNearbyDevices(){
  return 0;
}

// function stub
double convertToDistance(double value){
  return 0;
}