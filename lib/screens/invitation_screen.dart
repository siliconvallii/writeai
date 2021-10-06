import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:writeai/data/data.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // instantiate Realtime Database reference
    final DatabaseReference ref = FirebaseDatabase.instance.reference();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Invitation'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Text('You have been invited'),
              ElevatedButton(
                child: const Text('Join'),
                onPressed: () {
                  // set user 'joined' parameter to true
                  try {
                    ref
                        .child('users')
                        .child(user['uid'])
                        .child('joined')
                        .set(true);
                  } on Error {
                    rethrow;
                  }

                  // navigate to HomeScreen
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
