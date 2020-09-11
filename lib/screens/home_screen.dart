import 'package:flutter/material.dart';
import 'package:stay_away_from_me/app.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/widgets/proximity_display.dart';

class HomeScreen extends StatelessWidget {
  
  static final int count = 0;
  static bool isScanning = false;
  static final String title = 'Stay Away From Me';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
        ),
        floatingActionButton: SizedBox(
            width: 80,
            height: 80,
            child: FloatingActionButton(
              child: Text(decideButtonText(isScanning), textScaleFactor: 1.3,),
              onPressed: () {
                isScanning = toggleScan(isScanning);
                print('Toggling isScanning: ${isScanning}');
              },
            ),
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: EdgeInsets.only(left: getPaddingAmount(context, 0.05, true), right: getPaddingAmount(context, 0.05, true)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${count} Nearby Devices', textScaleFactor: 1.5),
              Padding(
                padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
              ),
              ProximityDisplay(),
            ],
          ),
        )
      );   
    }
  }
