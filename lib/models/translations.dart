import 'dart:ui';

class Translations{
  final Locale locale;

  Translations({this.locale});

  final supportedLanguages = [
    'en',
    'es',
    'cn',
    'ru',
    'dap',
    'fr',
    'ar',
  ];

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
      'bluetooth': 'Must enable Bluetooth to scan for other devices',
      'prompt': 'To start searching for nearby devices, press Scan',
      'welcome': 'Welcome to Stay Away From Me!'
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
      'prompt': 'Para comenzar a buscar dispositivos cercanos, presione Escanear',
      'welcome': '¡Bienvenido a Stay Away From Me!'
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
      'prompt': '要开始搜索附近的设备，请按扫描',
      'welcome': '欢迎远离我！',
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
      'prompt': 'Чтобы начать поиск устройств поблизости, нажмите Сканировать',
      'welcome': 'Добро пожаловать, чтобы держаться подальше от меня!',
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
      'prompt': 'आस-पास के उपकरणों की खोज शुरू करने के लिए, स्कैन दबाएं',
      'welcome': 'मेरे से दूर रहने के लिए आपका स्वागत है!',
    },

    'fr': {
      'appTitle': 'Reste Loin De Moi',
      'stop': 'Arrêtez',
      'scan': 'Analyse',
      'nearDevs': 'Appareils à Proximité',
      'distance': 'Distance',
      'meters': 'mètres',
      'scanning': 'Recherche d\'appareils ...',
      'errorScanning': 'Erreur lors de la recherche de périphériques ...',
      'bluetooth': 'Doit activer Bluetooth pour rechercher d\'autres appareils',
      'prompt': 'Pour commencer la recherche d\'appareils à proximité, appuyez sur Scan',
      'welcome': 'Bienvenue à Reste Loin De Moi!'
    },

    'ar': {
      'appTitle' : 'ابق بعيد عني',
      'stop': 'قف',
      'scan': 'مسح',
      'nearDevs': 'الأجهزة القريبة',
      'distance': 'مسافة',
      'meters': 'أمتار',
      'scanning': 'جارٍ البحث عن أجهزة ',
      'errorScanning': 'خطأ في البحث عن الأجهزة ...',
      'bluetooth': 'يجب تمكين Bluetooth للبحث عن أجهزة أخرى',
      'prompt': 'لبدء البحث عن الأجهزة المجاورة ، اضغط على مسح',
      'welcome': 'مرحبًا بكم في البقاء بعيدًا عني!'
    },
  };

  String getTranslation(String label){
    final String languageCode = window.locale.languageCode;

    if(isSupported(languageCode)){
      return labels[languageCode][label];
    } 
    return labels['en'][label]; // if not supported default at English
  } 

  String getLanguageCode() => window.locale.languageCode;

  bool isSupported(final String language){
    if(supportedLanguages.contains(language)){
      return true;
    }
    return false;
  }
}

