// packages
import 'package:flutter/material.dart';
// screens
import 'package:writeai/providers/google_sign_in.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AboutUs'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('Welcome'),
              const Text(''),
              ElevatedButton(
                child: const Text('Sign-in with Google'),
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
            ],
          ),
        ),
      ),
    );
  }
}
