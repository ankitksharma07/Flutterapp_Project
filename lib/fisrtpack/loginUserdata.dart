import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

class SecondPage extends StatefulWidget {
  final User value;

  SecondPage({Key key, this.value}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Second Page')),
      body: new Container(
        child: new Center(
          child: Column(
            children: <Widget>[

              Padding(
                child: new Text(
                  'PASSED VALUES',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                child: new Text(
                  'Email: ${widget.value.Email}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'PASSWORD : ${widget.value.Password}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              )

            ],

          ),
        ),
      ),
    );
  }
}