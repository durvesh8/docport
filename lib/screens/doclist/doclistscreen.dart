import 'package:flutter/material.dart';
import 'package:docport/screens/doclist/doc.dart';
import 'package:docport/screens/bookappointment/book.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';

class DocList extends StatelessWidget {
  static String routeName = "/signinscreen/doclist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Find A Doctor",style:TextStyle(fontSize: 20)),centerTitle: true),
      body: DocListBody(),
    );
  }
}


class DocListBody extends StatefulWidget {
  @override
  _DocListBodyState createState() => _DocListBodyState();
}

class _DocListBodyState extends State<DocListBody> {
  List<Doc> docs = [];
  void createlist(){
    docs.add(new Doc("Amir Dev Wable","1.png","MBBS",87656898));
    docs.add(new Doc("Sushmita Sankar","2.png","MD",87637898));
    docs.add(new Doc("Abhinav Dar","1.png","MBBS",87657848));
    docs.add(new Doc("Akhil Singhal","1.png","MD",87651898));
    docs.add(new Doc("Rupesh Ram Mistry","1.png","MBBS",83657898));
    docs.add(new Doc("Jasmin Sha","2.png","MD",87657818));
    docs.add(new Doc("Lalita Dayal","2.png","MBBS",87650898));
    docs.add(new Doc("Mustafa Ram Narine","1.png","MD",87057898));
  }

  @override
  void initState() {
    super.initState();
    createlist();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0,8.0,0,10.0),
          child: Row(
            children: [
                    DropDown<String>(
                      items: <String>["Nicobar", "Andaman", "Puducherry"],
                      initialValue: "Nicobar",
                      hint: Text("Select City"),
                      onChanged: (String value) {
                        // setState(() {print(value);});
                        }
                    ),
                    DropDown<String>(
                      items: <String>["MD", "MBBS", "BEMS"],
                      
                      hint: Text("Qualification"),
                      onChanged: (String value) {
                        // setState(() {print(value);});
                        }
                    ),
                    DropDown<String>(
                      items: <String>["Cardiologist", "Dermatlogist", "Family Physician"],
                      hint: Text("Specialisation"),
                      onChanged: (String value) {
                        // setState(() {print(value);});
                        }
                    ),
            ],
          ),
        ),
        Expanded(
                  child: Container(child:
          ListView.builder(itemCount: docs.length,
          itemBuilder: (context,index){
            return Padding(padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {

                      },
                      title: Text(docs[index].name),
                      subtitle: Text(docs[index].qualifications),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/${docs[index].docPhoto}'),
                      ),
                      trailing: IconButton(icon: Icon(Icons.favorite_border), onPressed: null),

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                        children:<Widget>[
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('View Profile'),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, BookAppointment.routeName);
                          },
                        ),
                        const SizedBox(width: 8),],
                    )
                  ],
                ),
              ),
            );
          },),),
        )
      ],
    );
  }
}

