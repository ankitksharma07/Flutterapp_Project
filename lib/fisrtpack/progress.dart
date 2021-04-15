import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/material.dart';

void main() => runApp(ProgressData());

/// This Widget is the main application widget.
class ProgressData extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   // debugShowCheckedModeBanner: false,
    return Scaffold(

    //debugShowCheckedModeBanner: false,
        // appBar: AppBar(title: Text('Flutter Card Example')),
        //  backgroundColor: Colors.yellow,
        body: Progress(),

    );
  }
}

class Progress extends StatefulWidget  {
  @override
  _ProgressState createState() => _ProgressState();
}

class _ProgressState extends State<Progress> {
  double percent = 0.0;
 // List<String,List<String,List<String>>> nestedList = [];

  @override
   progress() {
    Timer timer;
    timer = Timer.periodic(Duration(milliseconds:100),(_){
      setState(() {
        percent+=2;
        if(percent >= 100){
          timer.cancel();
          // percent=0;
        }
       // percent=percent-100;
      });
     // percent=percent-100;
    });
  //  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Linear Progress Bar"),
      ),
      body: Column(
        children: [
          Text(
            'Linear Percent indicator',
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700,
                fontSize: 15),
          ),
          SizedBox(
            height: 40,
          ),

          Container(
            margin: EdgeInsets.only(left:30,right:30),
            alignment:Alignment.center,
            child: LinearPercentIndicator( //leaner progress bar
             // animation: true,
              animationDuration: 1000,
              lineHeight: 20.0,
              percent:percent/100,
              center: Text(
                percent.toString() + "%",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              progressColor: Colors.blue[400],
              backgroundColor: Colors.grey[300],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            margin: EdgeInsets.only(left:30,right:30),
            alignment:Alignment.center,
            child: CircularPercentIndicator( //leaner progress bar
              // animation: true,
              animationDuration: 1000,
              radius: 120.0,
              lineWidth: 10.0,
              percent:percent/100,
              center: Text(
                percent.toString() + "%",
                style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              circularStrokeCap: CircularStrokeCap.round,
              progressColor: Colors.blue[400],
              backgroundColor: Colors.grey[300],
            ),
          ),
          RaisedButton(
            color: Colors.red,
            child: Text(
              'Save',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(18.0),
          ),
            onPressed: (){
              progress();
              final snackBar = SnackBar(
                content: Text('Progress bar example'),
                duration: Duration(seconds: 5),
                backgroundColor: Colors.red,
                elevation: 10,
               // margin: EdgeInsets.only(bottom:30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black,width: 2),
                ),
                behavior: SnackBarBehavior.floating,
                width: 350,
                action: SnackBarAction(
                  label: 'Undo' ,
                  onPressed: () {
                    // Some code to undo the change.
                  },
                  textColor: Colors.white,
                  disabledTextColor: Colors.red,
                ),
              );
              percent=0.0;
              Scaffold.of(context).showSnackBar(snackBar);
            },
          )
        ],
      ),




    );
  }
}



