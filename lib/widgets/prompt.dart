import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stay_away_from_me/functions/functions.dart';
import 'package:stay_away_from_me/models/translations.dart';
import 'package:stay_away_from_me/screens/home_screen.dart';

class Prompt extends StatefulWidget {
  @override
  _PromptState createState() => _PromptState();
}

class _PromptState extends State<Prompt> {
  @override
  Widget build(BuildContext context) {

    final Translations translations = Translations(locale: Localizations.localeOf(context));

    return decideWidget(translations, context);
  }
}

Widget decideWidget(final Translations translations, BuildContext context){
  if(translations.getLanguageCode() == 'en'){
    
    HomeScreenState homeState = context.findAncestorStateOfType<HomeScreenState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        getSizedImage('assets/images/safmpng.png'),
        Padding(
          padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
        ),
        stackedText(translations, 'welcome'),
        Padding(
          padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
        ),
        stackedText(translations, 'prompt'),
        Padding(
          padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Text('Ft', textScaleFactor: 1.3,),
            Transform.scale(
              scale: 1.2,
              child: Switch(value: homeState.metricMode,
                onChanged: (value) => homeState.toggleMetric(value),
                activeColor: Colors.orange,
                inactiveThumbColor: Colors.blue[700],
                inactiveTrackColor: Colors.white,
              ),
            ),
              
            Text('Meters', textScaleFactor: 1.3)
          ], 
        ),
      ],
    );
  } else{
    return Column(
      children: [
          getSizedImage('assets/images/safmpng.png'),
          stackedText(translations, 'welcome'),
          Padding(
            padding: EdgeInsets.all(getPaddingAmount(context, 0.01, false))
          ),
          stackedText(translations, 'prompt'),
      ],
    );
  }
}

Stack stackedText(final Translations translations, final String textLabel){
  return Stack (
    children: <Widget>[
      // Stroked text as border.
      Text(
        translations.getTranslation(textLabel),
        style:
          TextStyle (
          fontFamily: 'LexendPeta',
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2
            ..color = Colors.blue[700],
          ), 
          textScaleFactor: 1.5, 
      ), 
      // Solid text as fill.
      Text(
        translations.getTranslation(textLabel),
        style:
          TextStyle (
          fontFamily: 'LexendPeta',
          color: Colors.grey[300],
          ),
          textScaleFactor: 1.5, 
      ),
    ],
  );
}

Flexible getSizedImage(final String assetName){
  return Flexible(
    child: FractionallySizedBox(
      heightFactor: 0.5,
      widthFactor: 0.5,
      child: Image.asset(assetName),
    ),
  );
}