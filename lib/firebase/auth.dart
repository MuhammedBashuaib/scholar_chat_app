import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<void> registerUser(String? email, String? password) async {
    // ignore: unused_local_variable
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  static Future<void> loginUser(String? email, String? password) async {
    // ignore: unused_local_variable
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
