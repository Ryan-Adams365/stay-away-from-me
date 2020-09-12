import 'dart:ui';

class Translations{
  final Locale locale;

  Translations({this.locale});

  final labels = {
    'en': {
      'appTitle' : 'Stay Away From Me',
      'stop': 'Stop',
      'scan': 'Scan',
      'nearDevs': 'Nearby Devices',
      'distance': 'Distance',
      'meters': 'meters' 
    },

    'es': {
      'appTitle' : 'Mantente Alejado De Mí',
      'stop': 'Detener',
      'scan': 'Escanear',
      'nearDevs': 'Dispositivos Cercanos',
      'distance': 'Distancia',
      'meters': 'metros' 
    },

    'cn': {
      'appTitle' : '离我远点',
      'stop': '停止',
      'scan': '扫瞄',
      'nearDevs': '附近的设备',
      'distance': '距离',
      'meters': '米' 
    },

    'ru': {
      'appTitle' : 'Держись Подальше От Меня',
      'stop': 'Стоп',
      'scan': 'Поиск',
      'nearDevs': 'Устройства Поблизости',
      'distance': 'Расстояние',
      'meters': 'метры' 
    },

    'in': {
      'appTitle' : 'मुझसे दूर रहो',
      'stop': 'रुकें',
      'scan': 'स्कैन',
      'nearDevs': 'निकट के उपकरण',
      'distance': 'दूरी',
      'meters': 'मीटर की दूरी पर' 
    },
  };

  String getTranslation(String label) => labels[locale.languageCode][label];
}

