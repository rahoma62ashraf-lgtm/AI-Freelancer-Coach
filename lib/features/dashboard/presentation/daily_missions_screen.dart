import 'package:flutter/material.dart';

class DailyMissionsScreen extends StatelessWidget {
  const DailyMissionsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Missions')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: const [
          CheckboxListTile(
            value: true,
            onChanged: null,
            title: Text('Solve 1 Dart OOP Challenge'),
          ),
          CheckboxListTile(
            value: false,
            onChanged: null,
            title: Text('Read about Clean Architecture Data Layer'),
          ),
        ],
      ),
    );
  }
}
