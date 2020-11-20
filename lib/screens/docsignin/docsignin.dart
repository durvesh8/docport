import 'package:docport/constants.dart';
import 'package:docport/screens/docsignin/components/body.dart';
import 'package:flutter/material.dart';

class DocSignIn extends StatelessWidget {
  static String routeName = '/docsignin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Sign In"),centerTitle: true,backgroundColor: appBarColor,),
      body: Body(),
    );
  }
}
