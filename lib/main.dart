import 'package:docport/constants.dart';
import 'package:docport/routes.dart';
import 'package:docport/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:docport/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DocPort',
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}

