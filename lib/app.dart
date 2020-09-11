import 'package:flutter/material.dart';
import 'package:stay_away_from_me/screens/home_screen.dart';

class App extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange[800],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white, 
          backgroundColor: Colors.orange[800],
        ),
        buttonColor: Colors.orange[800],
      ),
      home: HomeScreen(),
    );
  }
}

String decideButtonText(bool isScanning) => isScanning ? 'Scan' : 'Stop';

bool toggleScan(bool isScanning) => isScanning ? false : true; 