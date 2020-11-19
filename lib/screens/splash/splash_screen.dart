import 'package:docport/screens/splash/components/body.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("DocPort"),backgroundColor: Colors.lightBlue,),
      body: Body(),
    );
  }
}
