import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Prompt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center (
      child: Stack (
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
      ),
    );
  }
}
