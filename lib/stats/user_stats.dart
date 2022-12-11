import 'dart:convert';

import 'package:peepofat/stats/body_measurement.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xiaomi_scale/xiaomi_scale.dart';

class UserStats {
  int _age = 0;
  double _size = 0;
  MiScaleGender _gender = MiScaleGender.MALE;
  List<BodyMeasurement> _bodyMeasurements = [];
  SharedPreferences prefs = SharedPreferences.getInstance() as SharedPreferences;

  UserStats() {
    loadData();
  }

  int getAge() => _age;
  double getSize() => _size;
  MiScaleGender getGender() => _gender;
  List<BodyMeasurement> getBodyMeasurements() => _bodyMeasurements;

  void setAge(age) {
    _age = age;
  }

  void setSize(size) {
    _size = size;
  }

  void setGender(gender) {
    _gender = gender;
  }

  void addBodyMeasurement(BodyMeasurement measurement) {
    _bodyMeasurements.add(measurement);
  }

  void storeData() async {
    prefs.setInt("age", _age);
    prefs.setDouble("size", _size);
    prefs.setBool("gender", _gender == MiScaleGender.MALE);
    prefs.setString("body_measurements", jsonEncode(_bodyMeasurements));
  }
  
  void loadData() async {
    if(!prefs.containsKey("age")) {
      prefs.clear();
      return;
    }

    _age = prefs.getInt("age")!;
    _size = prefs.getDouble("size")!;
    _gender = prefs.getBool("gender")! ? MiScaleGender.MALE : MiScaleGender.FEMALE;
    _bodyMeasurements = jsonDecode(prefs.getString("body_measurements")!);
  }
}