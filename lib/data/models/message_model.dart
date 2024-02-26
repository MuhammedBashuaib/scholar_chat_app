import 'package:scholar_chat_app/const.dart';

class MessageModel {
  final String id;
  final String message;

  MessageModel({
    required this.message,
    required this.id,
  });

  factory MessageModel.fromJson(json) {
    return MessageModel(
        message: json[MyString.kMessages], id: json[MyString.kId]);
  }
}
