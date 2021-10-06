import 'package:flutter/material.dart';

class WaitlistScreen extends StatelessWidget {
  const WaitlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Waitlist'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text('You are waitlisted'),
        ),
      ),
    );
  }
}
