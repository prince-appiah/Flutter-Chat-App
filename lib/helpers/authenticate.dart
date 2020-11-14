import 'package:flutter/material.dart';
import 'package:flutter_chat_app/screens/sign_in.dart';
import 'package:flutter_chat_app/screens/sign_up.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignInScreen = true;

  void toggleScreen() {
    setState(() => showSignInScreen = !showSignInScreen);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignInScreen) {
      return SignIn(toggle: toggleScreen);
    } else {
      return SignUp(toggle: toggleScreen);
    }
  }
}
