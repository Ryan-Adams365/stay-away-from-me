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
      'meters': 'meters',
      'scanning': 'Scanning for devices...',
      'errorScanning': 'Error scanning for devices...',
      'bluetooth': 'Must enable Bluetooth to scan for other devices'
    },

    'es': {
      'appTitle' : 'Mantente Alejado De Mí',
      'stop': 'Detener',
      'scan': 'Escanear',
      'nearDevs': 'Dispositivos Cercanos',
      'distance': 'Distancia',
      'meters': 'metros',
      'scanning': 'Buscando dispositivos...',
      'errorScanning': 'Error al buscar dispositivos...',
      'bluetooth': 'Debe habilitar Bluetooth para buscar otros dispositivos',

    },

    'cn': {
      'appTitle' : '离我远点',
      'stop': '停止',
      'scan': '扫瞄',
      'nearDevs': '附近的设备',
      'distance': '距离',
      'meters': '米',
      'scanning': '扫描设备...',
      'errorScanning': '扫描设备时出错...',
      'bluetooth': '必须启用蓝牙才能扫描其他设备',
    },

    'ru': {
      'appTitle' : 'Держись Подальше От Меня',
      'stop': 'Стоп',
      'scan': 'Поиск',
      'nearDevs': 'Устройства Поблизости',
      'distance': 'Расстояние',
      'meters': 'метры',
      'scanning': 'Поиск устройств...',
      'errorScanning': 'Ошибка сканирования устройств...',
      'bluetooth': 'Необходимо включить Bluetooth для поиска других устройств',

    },

    'dap': {
      'appTitle' : 'मुझसे दूर रहो',
      'stop': 'रुकें',
      'scan': 'स्कैन',
      'nearDevs': 'निकट के उपकरण',
      'distance': 'दूरी',
      'meters': 'मीटर की दूरी पर',
      'scanning': 'उपकरणों के लिए स्कैनिंग...',
      'errorScanning': 'उपकरणों के लिए स्कैनिंग में त्रुटि...',
      'bluetooth': 'अन्य उपकरणों के लिए स्कैन करने के लिए ब्लूटूथ को सक्षम करना चाहिए',
    },
  };

  String getTranslation(String label) => labels[window.locale.languageCode][label];
}

