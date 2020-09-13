import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stay_away_from_me/screens/bluetooth_off_screen.dart';
import 'package:stay_away_from_me/screens/home_screen.dart';

class App extends StatelessWidget {
  
  final SharedPreferences preferences;

  App({Key key, @required this.preferences}) : super (key: key);

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
      home: StreamBuilder<BluetoothState>  (
        initialData: BluetoothState.unknown,
        stream: FlutterBlue.instance.state,
        builder: (context, snapshot) {
          final state = snapshot.data;
          if (state == BluetoothState.on) {
            return HomeScreen(preferences: preferences);
          }
          return BluetoothOffScreen(state: state);
        }
      )
    );
  }
}

String decideButtonText(bool isScanning) => isScanning ? 'Scan' : 'Stop';

bool toggleScan(bool isScanning) => isScanning ? false : true; 