import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/firebase/auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  final Auth _auth = Auth();

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoding());

    try {
      await _auth.loginUser(
        email: email,
        password: password,
      );
      emit(LoginSuccess());
    } on Exception catch (e) {
      emit(LoginFailure(errorMessage: e.toString()));
    }
  }
}
