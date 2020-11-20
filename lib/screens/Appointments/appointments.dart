import 'package:docport/constants.dart';
import 'package:docport/screens/Appointments/components/body.dart';
import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  static String routeName = '/docsignin/appointments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: docButtonColor,
      appBar: AppBar(title: Text("Appointments"),centerTitle: true,backgroundColor: appBarColor,),
      body: Body(),
    );
  }
}
