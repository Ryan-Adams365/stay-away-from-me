import 'package:flutter/material.dart';
import 'package:stay_away_from_me/app.dart';

class ScanButton extends StatefulWidget {
  @override
   bool isScanning;
   bool curState;

   ScanButton({this.isScanning});
  _ScanButtonState createState() => _ScanButtonState();
}

class _ScanButtonState extends State<ScanButton> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        child: Text(decideButtonText(widget.isScanning), textScaleFactor: 1.3,),
        onPressed: () {
          // setState(){
          //   widget.curState = toggleScan(widget.curState);
          // }
          print('Toggling isScanning: ${widget.isScanning}');
        },
      ),
    );
  }
}
String decideButtonText(bool isScanning) => isScanning ? 'Stop' : 'Scan';

bool toggleScan(bool isScanning) => isScanning ? false : true; 