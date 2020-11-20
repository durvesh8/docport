import 'package:docport/constants.dart';
import 'package:docport/size_config.dart';
import 'package:f_datetimerangepicker/f_datetimerangepicker.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
DateTime date=DateTime.now();
class BookAppointment extends StatelessWidget {
  static String routeName = '/signinscreen/doclist/bookappointment';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text("Doctor's Profile"),
        centerTitle: true,
        backgroundColor: appBarColor,
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                              fontSize: getProportionateScreenHeight(30),color: Colors.white)),
                      Text("MBBS",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(25),color: Colors.white)),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Text("Appollo Hospitals, Nashik-87785",
                          style: TextStyle(
                              fontSize: getProportionateScreenHeight(14),color: Colors.white)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.call,color: Colors.white,), Text("8888888888",style: TextStyle(color: Colors.white),)],
                      )
                    ],
                  )),
            ]),
      ),
      Expanded(flex:1,child:Text("About: Lorem ipsum dolor sit amet, consectetur adipiscing elit.\n Nulla vel gravida purus. Mauris pretium porta interdum.",style: TextStyle(color: Colors.white),)),
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
              color: buttonColor,
              child: Text("Request an Appointment",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white)),
              onPressed: () {
                DateTimeRangePicker(
                    startText: "From",
                    endText: "To",
                    doneText: "Yes",

                    cancelText: "Cancel",
                    interval: 5,
                    initialStartTime: DateTime.now(),
                    initialEndTime: DateTime.now().add(Duration(days: 20)),
                    mode: DateTimeRangePickerMode.dateAndTime,
                    minimumTime: DateTime.now().subtract(Duration(days: 5)),
                    maximumTime: DateTime.now().add(Duration(days: 25)),
                    use24hFormat: true,
                    onConfirm: (start, end) {
                      Navigator.pop(context);
                    }).showPicker(context);


              },
              minWidth: getProportionateScreenWidth(300),
              height: getProportionateScreenHeight(60),
            )))),
      ),
    ]);
  }
}
