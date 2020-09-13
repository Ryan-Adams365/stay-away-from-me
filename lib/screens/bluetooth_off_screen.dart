import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';

class BluetoothOffScreen extends StatelessWidget {
  final BluetoothState state;
  const BluetoothOffScreen({this.state});

  @override
  Widget build(BuildContext context) {
    final Translations translations = Translations(locale: Localizations.localeOf(context));

    final String title = translations.getTranslation('appTitle');

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset('assets/images/safmpng.png'),
        ),
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: getPaddingAmount(context, 0.05, true),
            right: getPaddingAmount(context, 0.05, true)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: FractionallySizedBox(
                heightFactor: 0.8,
                widthFactor: 0.8,
                child: Image.asset('assets/images/safmpng.png'),
              )
            ),
            
            Padding(
              padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
            ),
            Text(translations.getTranslation('bluetooth'), textScaleFactor: 1.5,),
          ]
        )
      )
    );
  }
}
