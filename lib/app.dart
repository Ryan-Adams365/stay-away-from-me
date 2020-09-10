import 'package:flutter/material.dart';

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
        body: Center(child: Text('Hello World!'),),
      ),
    );
  }
}