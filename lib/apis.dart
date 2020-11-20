import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


User user;
DateTime startTime = DateTime.now();
String accessToken = "";
String authToken = "";


bool getTokenAvailability(){
  if(DateTime.now().difference(startTime).inMinutes<10){
    return true;
  }
  else{
    return false;
  }
}

void renewAccessToken() async  {
  if(accessToken=="" || !getTokenAvailability()){
    startTime = DateTime.now();
    Response response = await post('https://dev.ndhm.gov.in/gateway/v0.5/sessions',headers: {'Content-Type':'application/json'},body: jsonEncode({"clientId": "SBX_000137",
      "clientSecret": "a66dc1a4-793c-4f79-9945-cdfc88c979c6"}));
    Map at = jsonDecode(response.body);
    accessToken=at['accessToken'];
  }
}


Future<bool> auth(String username,String password) async{
  renewAccessToken();
  Response authresponse = await post('https://healthidsbx.ndhm.gov.in/api/v1/auth/authPassword',headers: {'Authorization':'Bearer $accessToken','Content-Type':'application/json'},
  body: jsonEncode({
    "healthId": "$username",
    "password": "$password"
  }));
  Map authmap = jsonDecode(authresponse.body);
  if(authresponse.statusCode==200) {
    authToken = authmap['token'];
    saveUserDetails();
    return true;
  }
  else {
    return false;
  }
}

void saveUserDetails() async{
  Response profile = await get('https://healthidsbx.ndhm.gov.in/api/v1/account/profile',headers: {'Authorization':'Bearer $accessToken','Content-Type':'application/json','X-Token':'Bearer $authToken'});
  Map profilemap = jsonDecode(profile.body);
  user = new User(profilemap['healthIdNumber'], profilemap['healthId'], profilemap['mobile'], profilemap['firstName'], profilemap['name'], profilemap['yearOfBirth']);  
}


class User{
String healthIdNumber;
String healthId;
String mobile;
String firstName;
String name;
String yearOfBirth;
  User(this.healthIdNumber,this.healthId,this.mobile,this.firstName,this.name,this.yearOfBirth);
}

String getUserName(){
  return user.name;
}