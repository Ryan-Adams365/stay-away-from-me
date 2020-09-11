import 'package:flutter/material.dart';

class ScanButton extends StatefulWidget {
   bool isScanning;

   ScanButton({this.isScanning});
  @override
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
          setState( () {
            widget.isScanning = toggleScan(widget.isScanning);
          });
        },
      ),
    );
  }
}

String decideButtonText(bool isScanning) => isScanning ? 'Stop' : 'Scan';

bool toggleScan(bool isScanning) => isScanning ? false : true; 