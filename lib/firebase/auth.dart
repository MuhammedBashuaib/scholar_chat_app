import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    // ignore: unused_local_variable
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    // ignore: unused_local_variable
    UserCredential credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
