import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/cubits/register_cubit/register_cubit.dart';
import 'package:scholar_chat_app/helper/show_snack_bar.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_material_button.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_text_form_field.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_title_login.dart';
import 'package:scholar_chat_app/presentation/widgets/logo_app_with_name.dart';
import 'package:scholar_chat_app/presentation/widgets/recording_message.dart';

class SginUpScreen extends StatelessWidget {
  const SginUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String name = "";
    String email = "";
    String password = "";
    GlobalKey<FormState> formKey = GlobalKey();

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          Navigator.of(context).pushReplacementNamed(MyRoutes.kHomeScreen);
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoding ? true : false,
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
                            // name = value;
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
                              BlocProvider.of<RegisterCubit>(context).register(
                                email: email,
                                password: password,
                              );
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
      },
    );
  }
}
