import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
