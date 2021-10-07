import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:writeai/data/data.dart';
import 'package:writeai/widgets/bottom_button.dart';

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
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Finish sign in:',
                    style: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(flex: 15),
                TextField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 21,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD31788),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD31788),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD31788),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                const Spacer(flex: 5),
                TextField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      fontFamily: 'Lato',
                      fontSize: 21,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD31788),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD31788),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xffD31788),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                const Spacer(flex: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Transform.scale(
                      scale: 1.7,
                      child: Checkbox(
                        activeColor: const Color(0xffD31788),
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() => _isChecked = !_isChecked);
                        },
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => setState(() => _isChecked = !_isChecked),
                      child: const Text(
                        'I would like to subscribe to Write AI\'s'
                        '\nmailing list and receive updates about'
                        '\nthe app via email.',
                        style: TextStyle(
                          fontFamily: 'Lato',
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Spacer(flex: 3),
                  ],
                ),
                const Spacer(flex: 100),
                BottomButton(
                  title: 'Finish',
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
                const Spacer(flex: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
