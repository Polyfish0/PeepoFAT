import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatsRoute extends StatefulWidget {
  const StatsRoute({super.key});

  @override
  State<StatefulWidget> createState() => _StatsRoute();
}

class _StatsRoute extends State {
  int _number = 0;
  Future<void> getInt() async {
    setState(() {
      _number = 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    getInt();
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Card(
              child: SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  // Chart title
                  title: ChartTitle(text: 'Half yearly sales analysis'),
                  // Enable legend
                  legend: Legend(isVisible: true),

                  series: <LineSeries<SalesData, String>>[
                    LineSeries<SalesData, String>(
                        dataSource:  <SalesData>[
                          SalesData('Jan', 35),
                          SalesData('Feb', 28),
                          SalesData('Mar', 34),
                          SalesData('Apr', 32),
                          SalesData('May', 40)
                        ],
                        xValueMapper: (SalesData sales, _) => sales.year,
                        yValueMapper: (SalesData sales, _) => sales.sales,
                        // Enable data label
                        dataLabelSettings: DataLabelSettings(isVisible: true)
                    )
                  ]
              ),
            )
          ],
        )
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}