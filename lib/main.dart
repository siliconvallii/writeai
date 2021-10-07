// packages
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// screens
import 'package:writeai/screens/about_us_screen.dart';
import 'package:writeai/screens/editor_screen.dart';
import 'package:writeai/screens/form_screen.dart';
import 'package:writeai/screens/home_screen.dart';
import 'package:writeai/screens/initial_screen.dart';
import 'package:writeai/screens/invitation_screen.dart';
import 'package:writeai/screens/profile_screen.dart';
import 'package:writeai/screens/settings_screen.dart';
import 'package:writeai/screens/waitlist_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(const WriteAI());
}

class WriteAI extends StatelessWidget {
  const WriteAI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffD31788),
      ),
      initialRoute: '/initial',
      routes: {
        '/initial': (BuildContext context) => const InitialScreen(),
        '/about_us': (BuildContext context) => const AboutUsScreen(),
        '/form': (BuildContext context) => FormScreen(),
        '/waitlist': (BuildContext context) => const WaitlistScreen(),
        '/invitation': (BuildContext context) => const InvitationScreen(),
        '/home': (BuildContext context) => const HomeScreen(),
        '/settings': (BuildContext context) => const SettingsScreen(),
        '/profile': (BuildContext context) => const ProfileScreen(),
        '/editor': (BuildContext context) => EditorScreen(),
      },
    );
  }
}
