import 'package:docport/screens/bookappointment/datechoose.dart';
import 'package:docport/size_config.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
DateTime date=DateTime.now();
class BookAppointment extends StatelessWidget {
  static String routeName = '/signinscreen/doclist/bookappointment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's Profile"),
        centerTitle: true,
      ),
      body: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(height: getProportionateScreenHeight(40)),
      Expanded(
        flex: 2,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Container(
                      child: Image.asset(
                    'assets/images/1.png',
                    fit: BoxFit.fill,
                  ))),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Text("Amir Dev Wable",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(30))),
                      Text("MBBS",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(25))),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Text("Appollo Hospitals, Nashik-87785",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(14))),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.call), Text("8888888888")],
                      )
                    ],
                  )),
            ]),
      ),
      Expanded(flex:1,child:Text("Bio: Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Nulla vel gravida purus. Mauris pretium porta interdum.")),
      Expanded(
        flex: 4,
        child: Container(
          margin: EdgeInsets.all(30),
          child: Image.asset('assets/images/3.png', fit: BoxFit.fill),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
            margin: EdgeInsets.all(30),
            child: Material(
                child: InkWell(
                    child: FlatButton(
              color: Colors.lightBlue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text("Request an Appointment",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white)),
              onPressed: () {
                Navigator.popAndPushNamed(context, DateChoose.routeName);
              },
              minWidth: getProportionateScreenWidth(300),
              height: getProportionateScreenHeight(60),
            )))),
      ),
    ]);
  }
}
