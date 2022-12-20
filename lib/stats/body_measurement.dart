class BodyMeasurement {
  final int id;
  final int uid;
  final DateTime date;
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
    required this.uid,
    required this.date,
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
      "id": id,
      "uid": uid,
      "date": date,
      "weight": weight,
      "impedance": impedance,
      "bodyFat": bodyFat,
      "boneMass": boneMass,
      "water": water,
      "muscleMass": muscleMass,
      "bmi": bmi,
      "lbmCoefficient": lbmCoefficient
    };
  }
}