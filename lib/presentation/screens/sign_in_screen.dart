import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/firebase/auth.dart';
import 'package:scholar_chat_app/helper/show_snack_bar.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_material_button.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_text_form_field.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_title_login.dart';
import 'package:scholar_chat_app/presentation/widgets/logo_app_with_name.dart';
import 'package:scholar_chat_app/presentation/widgets/recording_message.dart';

// ignore: must_be_immutable
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String? email;

  String? password;

  bool isLoaded = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoaded,
      child: Scaffold(
        backgroundColor: MyColors.kMyDarkBlue,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: widthScreen * .03),
          child: Center(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Spacer(
                    flex: 2,
                  ),
                  const LogoAppWithName(),
                  const Spacer(
                    flex: 1,
                  ),
                  const CustomTitleLogin(
                    title: "Sign In",
                  ),
                  SizedBox(
                    height: heightScreen * .02,
                  ),
                  CustomTextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress,
                    obscureText: false,
                  ),
                  SizedBox(
                    height: heightScreen * .01,
                  ),
                  CustomTextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    hintText: "Password",
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: heightScreen * .02,
                  ),
                  CustomMaterialButton(
                    text: "Sign In",
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoaded = true;
                        setState(() {});
                        try {
                          await Auth.loginUser(email, password);
                          // ignore: use_build_context_synchronously
                          Navigator.of(context).pushReplacementNamed(
                              MyRoutes.kChatScreen,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            showSnackBar(
                              context,
                              "No user found for that email.",
                            );
                          } else if (e.code == "wrong-password") {
                            showSnackBar(
                              context,
                              "Wrong password provided for that user.",
                            );
                          }
                        } catch (e) {
                          showSnackBar(
                            context,
                            "There was an error.",
                          );
                        }
                        isLoaded = false;
                        setState(() {});
                      }
                    },
                  ),
                  SizedBox(
                    height: heightScreen * .01,
                  ),
                  RecordingMessage(
                    message: "don't have an account !",
                    textLink: "Sign Up",
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(MyRoutes.kSignUpScreen);
                    },
                  ),
                  const Spacer(
                    flex: 3,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
