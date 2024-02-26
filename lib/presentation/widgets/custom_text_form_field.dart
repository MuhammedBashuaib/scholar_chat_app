import 'package:flutter/material.dart';

import 'package:scholar_chat_app/const.dart';

class CustomTextFormField extends StatelessWidget {
  final TextInputType keyboardType;
  final String hintText;
  final bool obscureText;
  final Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.keyboardType,
    required this.hintText,
    required this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "The field is required";
        }
        return null;
      },
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: MyColors.kMyWhite70,
            fontSize: fSize,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widthScreen * .01,
            ),
            borderSide: const BorderSide(
              color: MyColors.kMyWhite,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widthScreen * .01,
            ),
            borderSide: const BorderSide(
              color: MyColors.kMyBlue,
              width: 2,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              widthScreen * .01,
            ),
            borderSide: const BorderSide(
              color: MyColors.kMyWhite,
              width: 2,
            ),
          )),
    );
  }
}
