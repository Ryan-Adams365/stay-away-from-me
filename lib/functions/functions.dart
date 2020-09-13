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
double convertToDistance(int rssi){
  double measuredPower = -74.0;
  double N = 2.0;

  return pow(10, ((measuredPower-rssi)/(10*N)));
}

/*
  Function: convertDistToStrength
  Description: returns a value between 0 and 1 for a 
    distance between min and max dist, where a 1 is 
    given if less than or equal to min dist, or 0 if 
    greater than or equal to max dist
*/
double convertDistToStrength(double distance){
  if (distance < 4)
    return 1.0;
  if (distance < 4.5)
    return 0.9;
  if (distance < 5)
    return 0.8;
  if (distance < 6)
    return 0.7;
  if (distance < 7)
    return 0.6;
  if (distance < 8)
    return 0.5;
  if (distance < 9)
    return 0.4;
  if (distance < 10)
    return 0.3;
  if (distance < 11)
    return 0.2;
  if (distance < 12)
    return 0.1;
  if (distance >= 12)
    return 0;
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

double metersToFt(double distance) => distance * 3.2808;
