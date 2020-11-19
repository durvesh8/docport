import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:docport/constants.dart';

ThemeData theme(){
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: appBarTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      textTheme:textTheme()
  );
}

AppBarTheme appBarTheme(){
  return AppBarTheme(
      color: Colors.lightBlue,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      textTheme: TextTheme(headline6: TextStyle(color: Colors.white,fontSize: 30))
  );
}

TextTheme textTheme(){
  return TextTheme(
      bodyText1: TextStyle(color: kTextColor),
      bodyText2: TextStyle(color: kTextColor)
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}