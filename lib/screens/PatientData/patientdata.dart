import 'package:docport/constants.dart';
import 'package:docport/screens/PatientData/components/body.dart';
import 'package:flutter/material.dart';


class PatientData extends StatelessWidget {
  static String routeName = '/docsignin/appointments/patientdata';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Patient Data"),centerTitle: true,backgroundColor: appBarColor,),
      body: Body(),
    );
  }
}