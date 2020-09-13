import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stay_away_from_me/screens/home_screen.dart';

class Prompt extends StatefulWidget {
  @override
  _PromptState createState() => _PromptState();
}

class _PromptState extends State<Prompt> {
  @override
  Widget build(BuildContext context) {

    HomeScreenState homeState = context.findAncestorStateOfType<HomeScreenState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        stackedText(),
        Row(children: [
          Text('Imperial'),
          Switch(
            value: homeState.metricMode,
            onChanged: (value) => homeState.toggleMetric(value),
          ),
          Text('Metric')
        ],)

      ],
    );
  }
}



Stack stackedText(){
  return Stack (
    children: <Widget>[
      // Stroked text as border.
      Text(
        'To start searching for nearby devices, press Scan.',
        style:
          TextStyle (
          fontFamily: 'LexendPeta',
          fontSize: 30,
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 6
            ..color = Colors.blue[700],
          ),  
      ), 
      // Solid text as fill.
      Text(
        'To start searching for nearby devices, press Scan.',
        style:
          TextStyle (
          fontFamily: 'LexendPeta',
          fontSize: 30,
          color: Colors.grey[300],
          ),
      ),
  ],
  );
}
