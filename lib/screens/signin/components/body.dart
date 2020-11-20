import 'dart:convert';
import 'package:docport/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:docport/screens/doclist/doclistscreen.dart';
import 'package:docport/screens/splash/components/body.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:docport/apis.dart';

final healthidcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String error = "";
  bool _obscuretext = true;
  String healthid;
  String password;
  bool _visibility = false;

  void toggle() {
    setState(() {
      _obscuretext = !_obscuretext;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView(
          children: [
            SizedBox(
              height: getProportionateScreenHeight(70),
            ),
            Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign In with your Health ID and password",
              textAlign: TextAlign.center,
              style: TextStyle(color: CupertinoColors.lightBackgroundGray),
            ),
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            Form(
              
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: healthidcontroller,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    style: TextStyle(color: docButtonColor),
                    decoration: InputDecoration(
                      labelText: "Health ID",
                      hintText: "example@sbx",
                      hintStyle: TextStyle(color: docButtonColor),
                      labelStyle: TextStyle(color: buttonColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        color: buttonColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: _obscuretext,
                    style: TextStyle(color: docButtonColor),
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(color: docButtonColor),
                      labelStyle: TextStyle(color: buttonColor),

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        onPressed: toggle,
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        color: buttonColor,
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(children: [
                    Icon(Icons.error,color: Colors.white,),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(error,style: TextStyle(color: CupertinoColors.extraLightBackgroundGray),)
                  ])
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            DefaultButton("Sign in", () {
              check();
            }),
            SizedBox(height: getProportionateScreenHeight(30),),
            Visibility(visible: _visibility,child: SpinKitWave(color: buttonColor,size: getProportionateScreenHeight(40),),replacement: SizedBox(height: getProportionateScreenHeight(40),),),
            SizedBox(height: getProportionateScreenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(16),color: CupertinoColors.lightBackgroundGray)),
                RichText(
                  text: TextSpan(
                    text: "Sign Up",
                        recognizer: TapGestureRecognizer()..
                      onTap=(){
                          _launchUrl();
                        },
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: Colors.lightBlue)),
                  ),
              ],
            ),
          ],
        ),
      ),
    )
    );
  }

  void check()  async{
    if (healthidcontroller.text.isEmpty) {
      setState(() {
        error = "Please enter your email";
      });
      return;
    }
    if (passwordcontroller.text.isEmpty) {
      setState(() {
        error = "Please enter your password";
      });
      return;
    }
    setState(() {
      _visibility=true;
    });
    bool authorized = await auth(healthidcontroller.text,passwordcontroller.text);
    if(authorized==false){
      setState(() {
        error="Check your Credentials";
        _visibility=false;
      });
      return;
    }
    // await Future.delayed(Duration(seconds: 5));
    Navigator.pushNamed(context, DocList.routeName);
  }
}

_launchUrl() async {
  const url = 'https://healthid.ndhm.gov.in/register';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}