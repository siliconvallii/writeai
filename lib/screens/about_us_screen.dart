// packages
import 'package:flutter/material.dart';
// providers
import 'package:writeai/providers/google_sign_in.dart';
import 'package:writeai/widgets/bottom_button.dart';
import 'package:writeai/widgets/discover_more.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xff000000),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: SizedBox(
          height: MediaQuery.of(context).size.height / 100 * 4,
          child: Image.asset('assets/images/logo-removebg.png'),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 100 * 90,
            child: Column(
              children: [
                const Spacer(flex: 25),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Welcome. You are among the first'
                            '\n to join and use Write AI! 🎉',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'Lato',
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '\n\n\n'
                            'As one of our first users, you will have special'
                            ' access to the Write AI platform\'s capabilities,'
                            ' while you are a part of the beta access stage.'
                            '\n\n'
                            ' You will be able to test the app and provide'
                            ' feedback (if you wish),',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'Lato',
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                      TextSpan(
                        text: ' but more importantly',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'Lato',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          height: 1.6,
                        ),
                      ),
                      TextSpan(
                        text: ' you will be able to create documents with the'
                            ' AI and use them at your leasure!'
                            '\n\n'
                            ' When Write AI is offically out of beta, your'
                            ' documents will still be saved and accessible'
                            ' in your account. 👍',
                        style: TextStyle(
                          color: Color(0xff000000),
                          fontFamily: 'Lato',
                          fontSize: 16,
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(flex: 100),
                const DiscoverMore(),
                const Spacer(flex: 30),
                BottomButton(
                  title: 'Sign in with Google',
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
                      } else {
                        // user is new or waitlisted

                        Navigator.pushNamed(context, '/waitlist');
                      }
                    } on Error {
                      rethrow;
                    }
                  },
                ),
                const Spacer(flex: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
