import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';

class CustomTextButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  const CustomTextButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fSize * 1.1,
          fontWeight: FontWeight.bold,
          color: MyColors.kMyLightBlue,
        ),
      ),
    );
  }
}
