import 'package:flutter/material.dart';
import 'package:stay_away_from_me/screens/home_screen.dart';

class App extends StatelessWidget {
  
  static final String title = 'Stay Away From Me';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(child: Text('Start')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: HomeScreen()
    )
    );
  }
}