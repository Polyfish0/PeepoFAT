import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xiaomi_scale/xiaomi_scale.dart';

class ScanRoute extends StatefulWidget {
  const ScanRoute({super.key});

  @override
  State<StatefulWidget> createState() => _ScanRoute();
}

class _ScanRoute extends State {
  double _weight = 0;
  bool _reading = false;
  String _buttonText = "Sync";
  late StreamSubscription _subscription;
  final MiScale _mi = MiScale.instance;

  void sync() async {
    if(!_reading) {
      _reading = true;
      setState(() {
        _buttonText = "Warte auf Daten von der Waage";
      });
      _subscription = _mi.takeMeasurements().listen((MiScaleMeasurement measurement) {
        setState(() {
          switch(measurement.stage) {
            case MiScaleMeasurementStage.MEASURED:
              _weight = measurement.weight;
              _reading = false;
              ScaffoldMessenger.of(context).clearMaterialBanners();
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  content: const Text("Messung abgeschlossen."),
                  actions: [MaterialButton(
                    child: const Text("OK"),
                    onPressed: () => ScaffoldMessenger.of(context).clearMaterialBanners()
                  )]
                )
              );
              _finishReading(measurement);
              _subscription.cancel();
              break;
            case MiScaleMeasurementStage.MEASURING:
              _weight = measurement.weight;
              break;
            case MiScaleMeasurementStage.STABILIZED:
              _weight = measurement.weight;
              ScaffoldMessenger.of(context).clearMaterialBanners();
              ScaffoldMessenger.of(context).showMaterialBanner(
                MaterialBanner(
                  content: const Text("Gewicht gemessen, bitte bleibe auf der Wage stehen zum Messen der anderen Werte."),
                  actions: [MaterialButton(
                    child: const Text("Überspringen"),
                    onPressed: () {
                      ScaffoldMessenger.of(context).clearMaterialBanners();
                      _reading = false;
                      _finishReading(measurement);
                      _subscription.cancel();
                    },
                  )]
                )
              );

              break;
            case MiScaleMeasurementStage.WEIGHT_REMOVED:
              _buttonText = "Sync";
              _reading = false;
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Fehler"),
                    content: const Text("Bitte bleibe bis zum Ende auf der Waage stehen!"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text("OK")
                      )
                    ],
                  );
                }
              );
              break;
          }
        });
      });
    } else {
      _reading = false;
      setState(() {
        _buttonText = "Sync";
      });
      _subscription.cancel();
    }
  }

  void _finishReading(measurement) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    const Text(
                      "Gewicht",
                      style: TextStyle(
                        fontSize: 64
                      ),
                    ),
                    Text(
                      "$_weight KG",
                      style: const TextStyle(
                        fontSize: 48
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Card(
                child: Column(
                  children: [
                    const Text(
                      "",
                      style: TextStyle(
                          fontSize: 64
                      ),
                    ),
                    Text(
                      "$_weight KG",
                      style: const TextStyle(
                          fontSize: 48
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Material(
        color: const Color(0xff424242),
        child: InkWell(
          onTap: sync,
          child: SizedBox(
            height: 56,
            child: Center(
              child: Text(_buttonText),
            ),
          ),
        ),
      ),
    );
  }
}