// packages
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:writeai/providers/google_sign_in.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Join Now'),
                onPressed: () {
                  Navigator.pushNamed(context, '/about_us');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
