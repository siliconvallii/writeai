import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:writeai/data/data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: const Color(0xffffffff),
        backgroundColor: const Color(0xffD31788),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Profile'),
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 100 * 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 100 * 2,
                        bottom: MediaQuery.of(context).size.height / 100 * 2,
                        right: MediaQuery.of(context).size.width / 100 * 5,
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          user['photoURL'],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          user['display_name'],
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 21,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          user['email'],
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            fontSize: 14,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height / 100 * 1,
                          ),
                          child: const Text(
                            'Free Member',
                            style: TextStyle(
                              color: Color(0xff6F6F6F),
                              fontFamily: 'Lato',
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 100 * 2,
                    ),
                    child: const Text(
                      'Log out',
                      style: TextStyle(
                        color: Color(0xffA42121),
                        fontFamily: 'Lato',
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: () async {
                    // FirebaseAuth log out
                    await FirebaseAuth.instance.signOut();

                    // navigate to InitialScreen
                    Navigator.pushNamed(context, '/initial');
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
