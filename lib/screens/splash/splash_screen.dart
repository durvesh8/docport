import 'package:docport/screens/splash/components/body.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/material.dart';
import 'package:docport/constants.dart';
import 'package:flutter/rendering.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(centerTitle: true,title: Text("DocPort"),backgroundColor: appBarColor,),
      body: Body(),
    );
  }
}
