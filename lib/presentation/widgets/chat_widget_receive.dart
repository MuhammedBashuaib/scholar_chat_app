import 'package:flutter/material.dart';

import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/data/models/message_model.dart';

class ChatWidgetReceive extends StatelessWidget {
  final MessageModel message;
  const ChatWidgetReceive({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: heightScreen * .018,
          horizontal: widthScreen * .03,
        ),
        margin: EdgeInsets.symmetric(
          vertical: heightScreen * .01,
          horizontal: widthScreen * .02,
        ),
        decoration: BoxDecoration(
          color: MyColors.kMyGreenBlue,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(widthScreen * .05),
            topLeft: Radius.circular(widthScreen * .05),
            topRight: Radius.circular(widthScreen * .05),
          ),
        ),
        child: Text(
          message.message,
          style: TextStyle(
            fontSize: fSize * 1.2,
            color: MyColors.kMyWhite,
          ),
        ),
      ),
    );
  }
}
