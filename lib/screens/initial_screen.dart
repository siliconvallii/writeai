// packages
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:writeai/data/data.dart';
import 'package:writeai/providers/google_sign_in.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // instantiate Realtime Database reference
    final DatabaseReference ref = FirebaseDatabase.instance.reference();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                child: const Text('Google Sign In'),
                onPressed: () async {
                  try {
                    final Map _user = await googleSignIn();
                    if (_user['joined']) {
                      // user has joined

                      // redirect to HomeScreen
                      Navigator.pushNamed(context, '/home');
                    } else if (_user['invited']) {
                      // user has been invited

                      Navigator.pushNamed(context, '/invitation');
                    } else if (_user['waitlisted']) {
                      // user is waitlisted

                      Navigator.pushNamed(context, '/waitlist');
                    }
                  } on Error {
                    rethrow;
                  }
                },
              ),
              ElevatedButton(
                child: const Text('Home'),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
