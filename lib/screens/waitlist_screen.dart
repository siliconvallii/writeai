import 'package:flutter/material.dart';
import 'package:writeai/widgets/discover_more.dart';

class WaitlistScreen extends StatelessWidget {
  const WaitlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          elevation: 0,
        ),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 100 * 90,
              child: Column(
                children: [
                  const Spacer(flex: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 100 * 10,
                    child: Image.asset('assets/images/logo-removebg.png'),
                  ),
                  const Spacer(flex: 40),
                  const Text(
                    'Thanks for signing up!  🎉',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(flex: 20),
                  const Text(
                    'We will send you an email when your account'
                    ' is ready.\n\nIf you’ve signed up for our'
                    ' newsletter, you will also be getting updates'
                    ' from us as we publish them.'
                    ' If you wish to subscribe to our list,'
                    ' you can do that from our website.'
                    '\n\nWe can’t wait to write with you soon!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Lato', fontSize: 16, height: 1.6),
                  ),
                  const Spacer(flex: 15),
                  Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width / 100 * 80,
                    child: const Text(
                      '-Your team at Write AI',
                      style: TextStyle(
                        fontFamily: 'Lato',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  const Spacer(flex: 100),
                  const DiscoverMore(),
                  const Spacer(flex: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
