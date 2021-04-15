import 'dart:async';
import 'package:flutter_app/fisrtpack/postclassdata.dart';
import 'package:flutter_app/fisrtpack/postnetwork.dart';
import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

void main() {
  runApp(newpostdata());
}

class newpostdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json API Fatching"),
      ),
      body: postdata(),
    );
  }
}

class postdata extends StatefulWidget {
  @override
  _postdataState createState() => _postdataState();
}

class _postdataState extends State<postdata> {
  bool pressed = false;
  final TextEditingController Id = TextEditingController();
//  List<Users> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            // height: 300,
            // width: 400,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          TextField(
            controller: Id,
            decoration: InputDecoration(hintText: 'Enter Name'),
          ),
          RaisedButton(
              child: Text('Create Data'),
              color: Colors.blue,
              onPressed: () => {
                    setState(() {
                      pressed = true;
                    })
                  }),
          pressed ? fetchData(Id) : SizedBox(),
        ])));
  }
}

FutureBuilder<Users> fetchData(Id) {
  return FutureBuilder<Users>(
      future: fetchPosts(Id.text.toString()),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return getdata(snapshot);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      });
}

Widget getdata(snapshot) {
  return Padding(
    padding: const EdgeInsets.all(35),
    child: Column(
      children: [
        Padding(padding: EdgeInsets.all(20)),
        Text(
          "Name:-    " + snapshot.data.name,
          style: TextStyle(fontSize: 20),
        ),
        Text("Email Id:-   " + snapshot.data.email),
        Text("Number :-   " + snapshot.data.phone),
      ],
    ),
  );
}
