import 'package:docport/screens/Appointments/appointments.dart';
import 'package:docport/size_config.dart';
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
                  color: Colors.black,
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Sign In with your Doctor ID and password",
              textAlign: TextAlign.center,
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
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color:Colors.orange),
                      labelText: "Doctor ID",
                      hintText: "example@doc",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: Icon(
                        Icons.alternate_email,
                        color: Colors.orange,
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
                      labelStyle: TextStyle(color:Colors.orange),
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: IconButton(
                        onPressed: toggle,
                        icon: Icon(
                          Icons.remove_red_eye,
                        ),
                        color: Colors.orange,
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
            Material(child: InkWell(child: FlatButton(color: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),child: Text("Sign in",style: TextStyle(fontSize: getProportionateScreenWidth(26),color: Colors.white)),
             onPressed: (){check();},minWidth: getProportionateScreenWidth(300),
                           height: getProportionateScreenHeight(100),))),
            SizedBox(height: getProportionateScreenHeight(50)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Don't have an account?",
                    style:
                        TextStyle(fontSize: getProportionateScreenWidth(16))),
                Text("Sign Up",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.orange))
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
