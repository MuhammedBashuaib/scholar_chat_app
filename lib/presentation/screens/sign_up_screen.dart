import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:scholar_chat_app/const.dart';
// import 'package:scholar_chat_app/firebase/auth.dart';
import 'package:scholar_chat_app/helper/show_snack_bar.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_material_button.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_text_form_field.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_title_login.dart';
import 'package:scholar_chat_app/presentation/widgets/logo_app_with_name.dart';
import 'package:scholar_chat_app/presentation/widgets/recording_message.dart';

class SginUpScreen extends StatefulWidget {
  const SginUpScreen({super.key});

  @override
  State<SginUpScreen> createState() => _SginUpScreenState();
}

class _SginUpScreenState extends State<SginUpScreen> {
  String? name;

  String? email;

  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoaded = false;

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const LogoAppWithName(),
                    SizedBox(
                      height: heightScreen * .07,
                    ),
                    const CustomTitleLogin(title: "Sign Up"),
                    SizedBox(
                      height: heightScreen * .02,
                    ),
                    CustomTextFormField(
                      keyboardType: TextInputType.text,
                      hintText: "Name",
                      obscureText: false,
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: heightScreen * .01,
                    ),
                    CustomTextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    SizedBox(
                      height: heightScreen * .01,
                    ),
                    CustomTextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      keyboardType: TextInputType.visiblePassword,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    SizedBox(
                      height: heightScreen * .02,
                    ),
                    CustomMaterialButton(
                      text: "Sign Up",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          isLoaded = true;
                          setState(() {});
                          try {
                            // await Auth.registerUser(email, password);
                            // // ignore: use_build_context_synchronously
                            // showSnackBar(
                            //   context,
                            //   "Success.",
                            // );
                            // // ignore: use_build_context_synchronously
                            Navigator.of(context)
                                .pushNamed(MyRoutes.kSignInScreen);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context,
                                  "The password provided is too weak.");
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context,
                                  "The account already exists for that email.");
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
                    RecordingMessage(
                      message: "Already have an account!",
                      textLink: "Sign IN",
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(MyRoutes.kSignInScreen);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
