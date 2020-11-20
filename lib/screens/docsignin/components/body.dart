import 'package:docport/constants.dart';
import 'package:docport/screens/Appointments/appointments.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final docidcontroller = TextEditingController();
final passwordcontroller = TextEditingController();

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String error = "";
  bool _obscuretext = true;
  String docid;
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
                  color: Colors.white,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign In with your Doctor ID and password",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: CupertinoColors.extraLightBackgroundGray
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(100),
            ),
            Form(
              
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: docidcontroller,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    style: TextStyle(color: CupertinoColors.extraLightBackgroundGray),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:docButtonColor),
                      labelText: "Doctor ID",
                      hintText: "example@doc",
                      hintStyle: TextStyle(color: docButtonColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        color: docButtonColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  TextFormField(
                    controller: passwordcontroller,
                    obscureText: _obscuretext,
                    style: TextStyle(color: CupertinoColors.extraLightBackgroundGray),
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:docButtonColor),
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(color: docButtonColor),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        onPressed: toggle,
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        color: docButtonColor,
                      ),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Row(children: [
                    Icon(Icons.error,color: Colors.white,),
                    SizedBox(
                      width: getProportionateScreenWidth(10),
                    ),
                    Text(error,style: TextStyle(color: Colors.white),)
                  ])
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(50),
            ),
            Material(child: InkWell(child: FlatButton(color: docButtonColor,
              child: Text("Sign in",style: TextStyle(fontSize: getProportionateScreenWidth(26),color: Colors.black)),
             onPressed: (){check();},minWidth: getProportionateScreenWidth(300),
                           height: getProportionateScreenHeight(100),))),
            SizedBox(height: getProportionateScreenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(16),color: CupertinoColors.extraLightBackgroundGray)),
                Text("Sign Up",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: docButtonColor))
              ],
            ),
          ],
        ),
      ),
    )
    );
  }

  void check() {
    if (docidcontroller.text.isEmpty) {
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
    Navigator.pushNamed(context, Appointments.routeName);
  }
}
