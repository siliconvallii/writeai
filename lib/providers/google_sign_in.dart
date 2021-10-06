import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:writeai/data/data.dart';

Future<Map> googleSignIn() async {
  try {
    // instantiate Realtime Database reference
    final DatabaseReference ref = FirebaseDatabase.instance.reference();

    // sign in Google user
    GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();

    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    // extract credentials from Google user
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    // use credentials to authenticate in Firebase Auth
    UserCredential auth =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // check if Google user is a new user
    if (auth.additionalUserInfo!.isNewUser) {
      // is new

      // create user Map
      final Map _user = {
        'display_name': auth.user!.displayName,
        'email': auth.user!.email,
        'photoURL': auth.user!.photoURL,
        'uid': auth.user!.uid,
        'waitlisted': true,
        'invited': false,
        'joined': false,
      };

      // store user Map
      user = _user;

      // create user in Realtime Database
      await ref.child('users').child(auth.user!.uid).set(user);
    } else {
      // is not new

      // fetch user data from Realtime Database and store user Map
      await ref
          .child('users')
          .child(FirebaseAuth.instance.currentUser!.uid)
          .get()
          .then((_user) => user = _user.value);
    }

    return user;
  } on Error {
    rethrow;
  }
}
