import 'package:docport/screens/docsignin/docsignin.dart';
import 'package:docport/screens/signin/sign_in_screen.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: SingleChildScrollView(
                  child: Column(
              children: <Widget>[
                
                SizedBox(height: getProportionateScreenHeight(20),),
                Image.asset('assets/images/patienthome.jpg',height: getProportionateScreenHeight(200)),
                SizedBox(height: getProportionateScreenHeight(20),), 
                DefaultButton("Healthcare seeker",
                  () {Navigator.pushNamed(context, SignInScreen.routeName);}),
                
                SizedBox(height: getProportionateScreenHeight(20),),
                Image.asset('assets/images/dochome.jpg',height: getProportionateScreenHeight(200),),
                SizedBox(height: getProportionateScreenHeight(20),),
                Material(child: InkWell(child: FlatButton(color: Colors.orange,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),child: Text("Healthcare Provider",style: TextStyle(fontSize: getProportionateScreenWidth(26),color: Colors.white)), onPressed: () {Navigator.pushNamed(context,DocSignIn.routeName);},minWidth: getProportionateScreenWidth(300),
                           height: getProportionateScreenHeight(60),)))
              ],
            ),
        ),
      ),
    );
  }
}


class DefaultButton extends StatelessWidget {
  String text;
  Function onpress;
  DefaultButton(this.text,this.onpress);
  @override
  Widget build(BuildContext context) {
    return Material(child: InkWell(child: FlatButton(color: Colors.lightBlue,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),child: Text(text,style: TextStyle(fontSize: getProportionateScreenWidth(26),color: Colors.white)), onPressed: onpress,minWidth: getProportionateScreenWidth(300),
      height: getProportionateScreenHeight(60),)));
  }
}

