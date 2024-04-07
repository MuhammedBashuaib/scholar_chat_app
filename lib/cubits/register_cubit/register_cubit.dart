import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:scholar_chat_app/firebase/auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  final Auth _auth = Auth();

  Future<void> register({
    required String email,
    required String password,
  }) async {
    emit(RegisterLoding());
    try {
      await _auth.registerUser(
        email: email,
        password: password,
      );
      emit(RegisterSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          RegisterFailure(
            errorMessage: "The password provided is too weak.",
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          RegisterFailure(
            errorMessage: "The account already exists for that email.",
          ),
        );
      }
    } catch (e) {
      emit(
        RegisterFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
