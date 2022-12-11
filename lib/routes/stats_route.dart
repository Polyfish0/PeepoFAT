import 'package:flutter/material.dart';
import 'package:peepofat/stats/body_measurement.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../stats/user_stats.dart';

class StatsRoute extends StatefulWidget {
  late UserStats userStats;

  StatsRoute(this.userStats, {super.key});

  @override
  State<StatefulWidget> createState() => _StatsRoute(userStats);
}

class _StatsRoute extends State {
  List<Widget> _listViewElements = [];
  late UserStats userStats;

  _StatsRoute(userStats);

  @override
  Widget build(BuildContext context) {
    for(BodyMeasurement bodyStats in userStats.getBodyMeasurements()) {
      _listViewElements.add(
        Card(
          child: Text("F")
        )
      );
    }

    return Scaffold(
      body: Center(
        child: ListView(
          children: _listViewElements
        )
      ),
    );
  }
}

class WeightData {
  WeightData(this.weight, this.timestamp);
  final double weight;
  final int timestamp;
}