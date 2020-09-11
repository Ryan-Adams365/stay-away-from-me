import 'package:flutter/material.dart';
import 'package:stay_away_from_me/screens/home_screen.dart';

class App extends StatelessWidget {
  
  static final String title = 'Stay Away From Me';
  static bool isScanning = false;

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
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        floatingActionButton: 
        SizedBox(
          width: 80,
          height: 80,
          child: FloatingActionButton(
            child: Text(decideButtonText(isScanning), textScaleFactor: 1.3,),
            onPressed: () {
              // this will toggle the boolean value
              isScanning ? isScanning = false : isScanning = true; 
              print('Toggling isScanning: ${isScanning}');
            },
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: HomeScreen()
    )
    );
  }
}

String decideButtonText(bool isScanning) => isScanning ? 'Scan' : 'Stop';