import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peepofat/ScanRoute.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:xiaomi_scale/xiaomi_scale.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  final taskBarRoutes = {
    "/ScanRoute": (context) => const SecondRoute()
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: "Home"
            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings),
                label: "Settings"
            )
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            routes: taskBarRoutes,
            builder: (BuildContext context) {
              return const CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text("Hey"),
                ),
                child: Material(
                  child: Center(
                    child: Text("F")
                  ),
                ),
              );
            },
          );
        }
    );
  }
}