import 'package:flutter/material.dart';
import 'dart:math';

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

/*
  Function: convertToDistance
  Description: Converts signal stregnth to distance in meters
*/
double convertToDistance(int txPowerLevel){
  double measuredPower = -69.0;
  double N = 2.0;

  return pow(10, ((measuredPower-txPowerLevel)/(10*N)));
}

/*
  Function: convertDistToStrength
  Description: returns a value between 0 and 1 for a 
    distance between min and max dist, where a 1 is 
    given if less than or equal to min dist, or 0 if 
    greater than or equal to max dist
*/
double convertDistToStrength(double distance, double minDist, double maxDist){
  if(distance <= minDist){
    return 1;
  } else if(distance > maxDist){
    return 0;
  } else{
    return scaleValue(distance, minDist, maxDist);
  }
}

/*
  Function: scaleValue
  Description: scales a value between a lower and upperbound, where 
    the closer to the lowerbound the value is, the closer to 1 the 
    returned value is, and the closer to upperbound the value, the 
    closer to 1 the returned value is
*/
double scaleValue(double val, double lowerBound, double upperBound) {
  double scaled = (val - upperBound) / (lowerBound - upperBound);
  
  if(scaled == -0.0){ // this is to avoid a -0 
    scaled = 0; 
  }
  return scaled;
} 