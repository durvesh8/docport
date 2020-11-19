import 'package:docport/screens/signin/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/signinscreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),centerTitle: true,),
      body: Body(),
    );
  }
}
