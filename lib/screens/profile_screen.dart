import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:writeai/data/data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image(
                image: NetworkImage(user['photoURL']),
              ),
              Text(user['display_name']),
              Text(user['email']),
            ],
          ),
        ),
      ),
    );
  }
}
