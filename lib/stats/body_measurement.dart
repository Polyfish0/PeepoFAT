class BodyMeasurement {
  final int id;
  final DateTime unixTimestamp;
  final int weight;
  final int impedance;
  final double bodyFat;
  final double visceralFat;
  final double boneMass;
  final double water;
  final double muscleMass;
  final double bmi;
  final double lbmCoefficient;

  const BodyMeasurement({
    required this.id,
    required this.unixTimestamp,
    required this.weight,
    required this.impedance,
    required this.bodyFat,
    required this.visceralFat,
    required this.boneMass,
    required this.water,
    required this.muscleMass,
    required this.bmi,
    required this.lbmCoefficient
  });

  Map<String, dynamic> toMap() {
    return {
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
}