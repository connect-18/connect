import 'package:connect/screens/authentication/login.dart';
import 'package:connect/screens/authentication/signUp.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSignUp: toggle)
      : SignUpWidget(onClickedsignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}