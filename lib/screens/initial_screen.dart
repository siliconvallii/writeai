// packages
import 'package:flutter/material.dart';
// widgets
import 'package:writeai/widgets/bottom_button.dart';
import 'package:writeai/widgets/custom_header.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(flex: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height / 100 * 25,
                child: Image.asset('assets/images/logo-removebg.png'),
              ),
              const Spacer(flex: 40),
              const CustomHeader(title: 'WRITE AI'),
              const Spacer(),
              Container(
                height: 1,
                width: MediaQuery.of(context).size.width / 100 * 75,
                color: const Color(0xff000000),
              ),
              const Spacer(flex: 5),
              const Text(
                'enhance your writing with AI',
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Spacer(flex: 100),
              SizedBox(
                width: MediaQuery.of(context).size.width / 100 * 80,
                height: MediaQuery.of(context).size.height / 100 * 5,
                child: BottomButton(
                  title: 'Join Now',
                  onPressed: () {
                    Navigator.pushNamed(context, '/about_us');
                  },
                ),
              ),
              const Spacer(flex: 15),
            ],
          ),
        ),
      ),
    );
  }
}
