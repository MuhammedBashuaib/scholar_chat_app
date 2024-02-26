import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';

class LogoAppWithName extends StatelessWidget {
  const LogoAppWithName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          MyImage.kScholarImg,
          height: heightScreen * .12,
        ),
        Text(
          "Scholar Chat",
          style: TextStyle(
            fontFamily: "Pacifico",
            fontSize: fSize * 2.3,
            // fontWeight: FontWeight.bold,
            color: MyColors.kMyWhite,
          ),
        ),
      ],
    );
  }
}
