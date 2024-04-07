import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/cubits/cubit/login_cubit.dart';
import 'package:scholar_chat_app/helper/show_snack_bar.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_material_button.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_text_form_field.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_title_login.dart';
import 'package:scholar_chat_app/presentation/widgets/logo_app_with_name.dart';
import 'package:scholar_chat_app/presentation/widgets/recording_message.dart';

// ignore: must_be_immutable
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String email = "";
    String password = "";

    GlobalKey<FormState> formKey = GlobalKey();

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.of(context).pushNamed(MyRoutes.kHomeScreen);
        } else if (state is LoginFailure) {
          // ignore: avoid_print
          print(state.errorMessage);
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoding ? true : false,
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
                            BlocProvider.of<LoginCubit>(context)
                                .login(email: email, password: password);
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
      },
    );
  }
}
