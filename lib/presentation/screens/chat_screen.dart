import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:scholar_chat_app/const.dart';
import 'package:scholar_chat_app/data/models/message_model.dart';
import 'package:scholar_chat_app/presentation/widgets/chat_widget_receive.dart';
import 'package:scholar_chat_app/presentation/widgets/chat_widget_send.dart';
import 'package:scholar_chat_app/presentation/widgets/custom_text_field_send_massage.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference message =
      FirebaseFirestore.instance.collection(MyCollictions.kMessagesCollictions);
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrolarController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: MyColors.kMyDarkBlue,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              MyImage.kScholarImg,
              height: heightScreen * .065,
            ),
            Text(
              "Chat",
              style: TextStyle(
                fontSize: fSize * 1.3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream:
            message.orderBy(MyString.kCreatedAt, descending: true).snapshots(),
        // future: message.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messages = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messages.add(
                MessageModel.fromJson(snapshot.data!.docs[i]),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _scrolarController,
                    physics: const BouncingScrollPhysics(),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      if (messages[index].id == id) {
                        return ChatWidgetSend(
                          message: messages[index],
                        );
                      } else {
                        return ChatWidgetReceive(message: messages[index]);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widthScreen * .02,
                    vertical: heightScreen * .01,
                  ),
                  child: CustomTextFieldSendMassage(
                    controller: _textEditingController,
                    onSubmitted: (value) {
                      message.add(
                        {
                          MyString.kId: id,
                          MyString.kMessages: value,
                          MyString.kCreatedAt: DateTime.now(),
                        },
                      );
                      _textEditingController.clear();
                      _scrolarController.animateTo(
                        0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastOutSlowIn,
                      );
                    },
                  ),
                )
              ],
            );
          } else {
            return const Text("error");
          }
        },
      ),
    );
  }
}
