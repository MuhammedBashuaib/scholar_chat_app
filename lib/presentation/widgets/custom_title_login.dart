import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';

class CustomTitleLogin extends StatelessWidget {
  final String title;
  const CustomTitleLogin({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: fSize * 1.8,
            color: MyColors.kMyWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
