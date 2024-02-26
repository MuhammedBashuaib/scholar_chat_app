import 'package:flutter/material.dart';

//my colors
//////////////////////////////////////////////////////////////
class MyColors {
  static const Color kMyDarkBlue = Color(0xff2B475E);
  static const Color kMyLightBlue = Color(0xffC7EDE6);
  static const Color kMyWhite = Colors.white;
  static const Color kMyWhite70 = Colors.white70;
  static const Color kMyBlue = Colors.blue;
  static const Color kMyGreenBlue = Color(0xff006D84);
}
//////////////////////////////////////////////////////////////

//my images
//////////////////////////////////////////////////////////////
class MyImage {
  static const String kScholarImg = "assets/images/scholar.png";
}
//////////////////////////////////////////////////////////////

//my
//////////////////////////////////////////////////////////////
class MyIcons {}
//////////////////////////////////////////////////////////////

//Screen coordinates and the default size of the font
//////////////////////////////////////////////////////////////
double widthScreen = 0;
double heightScreen = 0;
double fSize = 0;

initializeHWFSize(BuildContext context) {
  widthScreen = MediaQuery.of(context).size.width;
  heightScreen = MediaQuery.of(context).size.height;
  fSize = widthScreen / 25;
}
//////////////////////////////////////////////////////////////

//My routes
///////////////////////////////////////////////
class MyRoutes {
  static const String kHomeScreen = "/";
  static const String kSignInScreen = "signInScreen";
  static const String kSignUpScreen = "signUpScreen";
  static const String kChatScreen = "chatScreen";
}

//My collictions
///////////////////////////////////////////////
class MyCollictions {
  static const String kMessagesCollictions = "messages";
}

//My Strings constanc
///////////////////////////////////////////////
class MyString {
  static const String kId = "id";
  static const String kMessages = "message";
  static const String kCreatedAt = "createdAt";
}
