import 'package:docport/screens/docsignin/components/body.dart';
import 'package:flutter/material.dart';

class DocSignIn extends StatelessWidget {
  static String routeName = '/docsignin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign In"),centerTitle: true,backgroundColor: Colors.orange,),
      body: Body(),
    );
  }
}
