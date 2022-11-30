class BodyMeasurement {
  late int unixTimestamp;
  late int weight;
  late int impedance;
  late double bodyFat;
  late double visceralFat;
  late double boneMass;
  late double water;
  late double muscleMass;
  late double bmi;
  late double lbmCoefficient;

  BodyMeasurement(this.unixTimestamp, this.weight, this.impedance, this.bodyFat, this.visceralFat, this.boneMass, this.water, this.muscleMass, this.bmi, this.lbmCoefficient);

  Map<String, dynamic> toJson() => {
    'unixTimestamp': unixTimestamp,
    'weight': weight,
    'impedance': impedance,
    'bodyFat': bodyFat,
    'boneMass': boneMass,
    'water': water,
    'muscleMass': muscleMass,
    'bmi': bmi,
    'lbmCoefficient': lbmCoefficient
  };
}