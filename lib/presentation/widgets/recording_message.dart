import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_text_button.dart';

class RecordingMessage extends StatelessWidget {
  final String message;
  final String textLink;
  final Function()? onPressed;
  const RecordingMessage({
    super.key,
    required this.message,
    required this.textLink,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: TextStyle(
            fontSize: fSize * 1.1,
            color: MyColors.kMyWhite,
          ),
        ),
        CustomTextButton(
          text: textLink,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
