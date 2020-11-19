import 'package:docport/screens/Appointments/components/body.dart';
import 'package:flutter/material.dart';

class Appointments extends StatelessWidget {
  static String routeName = '/docsignin/appointments';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appointments"),centerTitle: true,backgroundColor: Colors.orange,),
      body: Body(),
    );
  }
}
