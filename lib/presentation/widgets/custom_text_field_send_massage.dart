import 'package:flutter/material.dart';

import 'package:scholar_chat_app/const.dart';

class CustomTextFieldSendMassage extends StatelessWidget {
  final Function(String value)? onSubmitted;
  final TextEditingController controller;
  const CustomTextFieldSendMassage({
    super.key,
    this.onSubmitted,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
          hintText: "Send Message",
          hintStyle: TextStyle(
            fontSize: fSize * 1.1,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.send,
              size: heightScreen * .035,
            ),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widthScreen * .03),
            borderSide: const BorderSide(
                // color: MyColors.myDarkBlue,
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widthScreen * .03),
            borderSide: const BorderSide(
              color: MyColors.kMyDarkBlue,
              width: 2.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widthScreen * .03),
              borderSide: const BorderSide(
                color: MyColors.kMyBlue,
                width: 2.5,
              ))),
    );
  }
}
