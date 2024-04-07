import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat_app/cubits/cubit/login_cubit.dart';
import 'firebase_options.dart';

import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/presentation/screens/sign_in_screen.dart';
import 'package:scholar_chat_app/presentation/screens/sign_up_screen.dart';
import 'package:scholar_chat_app/presentation/screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: MyRoutes.kSignInScreen,
        routes: {
          MyRoutes.kSignInScreen: (context) => const SignInScreen(),
          MyRoutes.kSignUpScreen: (context) => const SginUpScreen(),
          MyRoutes.kChatScreen: (context) => const ChatScreen(),
        },
      ),
    );
  }
}
