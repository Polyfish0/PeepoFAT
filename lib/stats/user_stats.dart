import 'dart:convert';

import 'package:peepofat/stats/body_measurement.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStats {
  int _age = 0;
  int _size = 0;
  List<BodyMeasurement> _bodyMeasurements = [];
  SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;

  UserStats() {
    loadData();
  }

  int getAge() => _age;
  int getSize() => _size;
  List<BodyMeasurement> getBodyMeasurements() => _bodyMeasurements;

  void addBodyMeasurement(BodyMeasurement measurement) {
    _bodyMeasurements.add(measurement);
  }

  void storeData() async {
    prefs.setInt("age", _age);
    prefs.setInt("size", _size);
    prefs.setString("body_measurements", jsonEncode(_bodyMeasurements));
  }
  
  void loadData() async {
    _age = prefs.getInt("age")!;
    _size = prefs.getInt("size")!;
    _bodyMeasurements = jsonDecode(prefs.getString("body_measurements")!);
  }
}