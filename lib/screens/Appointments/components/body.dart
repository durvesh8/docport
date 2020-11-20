import 'package:docport/constants.dart';
import 'package:docport/screens/PatientData/patientdata.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: docButtonColor,
      child: Card(
        child: Column(
          children: [
            ListTile(
              onTap: () {},
              title: Text("Patient_name"),
              subtitle: Text("Request for a dental checkup"),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/4.png'),
              ),
              trailing: IconButton(icon: Icon(Icons.check), onPressed: () {}),
            ),
            Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget>[
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Request Data'),
                          onPressed: () {

                          },
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('View Data'),
                          onPressed: () {
                            Navigator.pushNamed(context, PatientData.routeName);
                          },
                        ),
                        const SizedBox(width: 8),],
                    )
          ],
        ),
      ),
    );
  }
}
