import 'dart:convert';

import 'package:docport/screens/doclist/doclistscreen.dart';
import 'package:docport/screens/splash/components/body.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';

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
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign In with your Health ID and password",
              textAlign: TextAlign.center,
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
                    decoration: InputDecoration(
                      labelText: "Health ID",
                      hintText: "example@sbx",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: _obscuretext,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        onPressed: toggle,
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(children: [
                    Icon(Icons.error),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(error)
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
            SizedBox(height: getProportionateScreenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(16))),
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

  void check()  {
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
    // Response response = await post('https://dev.ndhm.gov.in/gateway/v0.5/sessions',headers: {'Content-Type':'application/json'},body: jsonEncode({"clientId": "SBX_000137",
    //   "clientSecret": "a66dc1a4-793c-4f79-9945-cdfc88c979c6"}));
    // print(response.body);
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