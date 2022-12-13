import 'package:flutter/material.dart';
import 'package:peepofat/routes/create_profile_route.dart';

class SettingsRoute extends StatelessWidget {
  const SettingsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        child: Text("F"),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreateProfileRoute()
            )
          );
        }
      ),
    );
  }
}
