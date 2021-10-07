import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:writeai/data/data.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final DatabaseReference _ref = FirebaseDatabase.instance.reference();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: _firstNameController,
                decoration: const InputDecoration(labelText: 'First Name'),
              ),
              TextField(
                controller: _lastNameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() => _isChecked = !_isChecked);
                    },
                  ),
                  const Text('Subscribe to email updates'),
                ],
              ),
              ElevatedButton(
                child: const Text('Submit'),
                onPressed: () async {
                  try {
                    // set first_name
                    await _ref
                        .child('users')
                        .child(user['uid'])
                        .child('first_name')
                        .set(_firstNameController.text);

                    // set last_name
                    await _ref
                        .child('users')
                        .child(user['uid'])
                        .child('last_name')
                        .set(_lastNameController.text);

                    // set mailing_list
                    await _ref
                        .child('users')
                        .child(user['uid'])
                        .child('mailing_list')
                        .set(_isChecked);

                    // set joined to true
                    await _ref
                        .child('users')
                        .child(user['uid'])
                        .child('joined')
                        .set(true);
                  } on Error {
                    rethrow;
                  }

                  // navigate to Home
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
