import 'package:flutter/material.dart';
import 'package:peepofat/ScanRoute.dart';
import 'package:peepofat/StatsRoute.dart';
import 'package:peepofat/SettingsRoute.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("PeepoFAT"),
          leading: Image.asset("images/peepofat.png"),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.query_stats)),
              Tab(icon: Icon(Icons.sync)),
              Tab(icon: Icon(Icons.settings))
            ]
          )
        ),
        body: const TabBarView(
          children: [
            StatsRoute(),
            ScanRoute(),
            SettingsRoute()
          ]
        ),
      )
    );
  }
}