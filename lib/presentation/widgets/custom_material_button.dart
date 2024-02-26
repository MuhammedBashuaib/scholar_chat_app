import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';

class CustomMaterialButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  const CustomMaterialButton({
    super.key,
    this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: MyColors.kMyWhite,
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(
        horizontal: widthScreen * .39,
        vertical: heightScreen * .015,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fSize * 1.1,
          fontWeight: FontWeight.bold,
          color: MyColors.kMyDarkBlue,
        ),
      ),
    );
  }
}
