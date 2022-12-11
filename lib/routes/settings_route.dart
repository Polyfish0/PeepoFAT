import 'package:flutter/material.dart';
import 'package:peepofat/stats/user_stats.dart';

class SettingsRoute extends StatelessWidget {
  late UserStats userStats;
  SettingsRoute(userStats, {super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Settings"),
    );
  }
}
