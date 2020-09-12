import 'dart:ui';

class Translations{
  final Locale locale;

  Translations({this.locale});

  final labels = {
    'en': {
      'appTitle' : 'Stay Away From Me',
      'stop' : 'Stop',
      'scan' : 'Scan',
    },
  };

  String getTranslation(String label) => labels[locale.languageCode][label];
}

