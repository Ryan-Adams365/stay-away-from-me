import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  
  static final int count = 0;
  static final double horizontalPadding = 10;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: horizontalPadding, right: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${count} Nearby Devices', textScaleFactor: 1.5),
          SizedBox(height: 10,),
          Placeholder(),
        ],
      ),
    );
  }
}