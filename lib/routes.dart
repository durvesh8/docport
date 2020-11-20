import 'package:docport/screens/Appointments/appointments.dart';
import 'package:docport/screens/PatientData/patientdata.dart';
import 'package:docport/screens/bookappointment/book.dart';
import 'package:docport/screens/doclist/doclistscreen.dart';
import 'package:docport/screens/docsignin/docsignin.dart';
import 'package:docport/screens/signin/sign_in_screen.dart';
import 'package:docport/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

// All our routes will be here
final Map<String,WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  DocList.routeName: (context) => DocList(),
  BookAppointment.routeName: (context) => BookAppointment(),
  DocSignIn.routeName: (context) => DocSignIn(),
  Appointments.routeName: (context) => Appointments(),
  PatientData.routeName: (context) => PatientData(),
};