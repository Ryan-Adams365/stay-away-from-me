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
    if (rssiValues.length > 20) {
      rssiValues.removeAt(0);
    }
    calcRssiAvg();
  }

  void calcRssiAvg() {
    var sum = 0;
    var min = rssiValues[0];
    var min2 = rssiValues[0];
    var max = rssiValues[0];
    var max2 = rssiValues[0];
    rssiValues.forEach((element) {
      sum += element;
      if (element < min) {
        min = element;
      } else if (element < min2) {
        min2 = element;
      }
      if (element > max) {
        max = element;
      } else if (element > max2) {
        max2 = element;
      }
    });

    if (rssiValues.length > 10) {
      var adjustedSum = sum - (min + min2 + max + max2);
      this.rssiAvg = adjustedSum ~/ (rssiValues.length - 4);
    } else {
      this.rssiAvg = sum ~/ rssiValues.length;
    }
  }
}