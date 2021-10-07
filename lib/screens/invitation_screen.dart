import 'package:flutter/material.dart';
import 'package:writeai/widgets/bottom_button.dart';

class InvitationScreen extends StatelessWidget {
  const InvitationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          elevation: 0,
          centerTitle: true,
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
                  const Spacer(flex: 20),
                  const Text(
                    'Your Write AI invitation',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'Lato',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 30),
                  const Text(
                    'Hello Mads,'
                    '\n\nThank you again for using our app'
                    ' to sign up for the Write AI waitlist.'
                    '\n\nWe\'re thrilled to inform you'
                    ' that your Write AI application has'
                    ' been approved! You can use the'
                    ' button below to finish creating'
                    ' your account and start using Write AI.',
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontFamily: 'Lato',
                      fontSize: 16,
                      height: 1.6,
                    ),
                  ),
                  const Spacer(flex: 100),
                  BottomButton(
                    title: 'Finish Sign In',
                    onPressed: () => Navigator.pushNamed(context, '/form'),
                  ),
                  const Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
