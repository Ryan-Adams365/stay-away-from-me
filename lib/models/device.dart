class Device {
  int rssiLast;
  int rssiAvg;
  List<int> rssiValues;
  String id;
  String name;
  int staleCounter;

  Device(int firstRssi, this.id, this.name, this.staleCounter){
    rssiValues = [];
    addRssiValue(firstRssi);
  }

  void addRssiValue(int value) {
    this.rssiLast = value;
    rssiValues.add(value);
    if (rssiValues.length > 10) {
      rssiValues.removeAt(0);
    }
    calcRssiAvg();
  }

  void calcRssiAvg() {
    var sum = 0;
    rssiValues.forEach((element) {
      sum += element;
    });

    this.rssiAvg = sum ~/ rssiValues.length;
  }
}