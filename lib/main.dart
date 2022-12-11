import 'package:flutter/material.dart';
import 'package:peepofat/routes/scan_route.dart';
import 'package:peepofat/routes/stats_route.dart';
import 'package:peepofat/routes/settings_route.dart';
import 'package:peepofat/stats/user_stats.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:xiaomi_scale/xiaomi_scale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blueGrey
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    UserStats userStats = UserStats();
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PeepoFAT"),
          leading: Image.asset("assets/images/peepofat.png"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.bar_chart)),
              Tab(icon: Icon(Icons.sync)),
              Tab(icon: Icon(Icons.settings))
            ]
          )
        ),
        body: TabBarView(
          children: [
            StatsRoute(userStats),
            ScanRoute(userStats),
            SettingsRoute(userStats)
          ]
        ),
      )
    );
  }
}