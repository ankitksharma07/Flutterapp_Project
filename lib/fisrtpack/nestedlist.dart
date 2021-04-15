import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(new nestedlist());

class nestedlist extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(

          title: Text("Nested list Page"),
        ),
        body: listdata(),
      ),
    );
  }
}

class listdata extends StatefulWidget {

  @override
  _listdataState createState() => _listdataState();
}

_borderDesign() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
    borderSide: BorderSide(color: Colors.blue),
  );
}

class User {
  String Name, Student;

  User({this.Name, this.Student}) {

  }
}



class _listdataState extends State<listdata> {


  List<User> list = [];

  TextEditingController _NameController = TextEditingController();
  TextEditingController _StudentController = TextEditingController();

  List<List<User>> nestedlist = [];
  List<User> temp =[];

  final formKey = new GlobalKey<FormState>();

  onSubmit() {
    var form = formKey.currentState;
  //  if (form.validate()) {
      for(int i=0;i<list.length;i++){
        if(list[i].Name==null){
         // List temp1= [];
          list.add(User(
            Name: _NameController.text,
            Student: _StudentController.text,
          ));
        //  temp1.add(list[i].Name);
          nestedlist.add(list);
         // nestedlist[i]=list;

        }else{
         // List tmp= [];
          //  tmp=list[i].Name;
         // tmp.add(list[i]);
        //  nestedlist=tmp;
          // map[data[i].date]=temp1;
        }
      }


  //  }
  }

  // nestedlistdata(){
  //    for(int i=0;i<list.length;i++){
  //      if(list[i].Name==null){
  //        List temp1= [];
  //        temp1.add(list[i].Name);
  //        nestedlist[i]=temp1;
  //
  //      }else{
  //        List tmp= [];
  //      //  tmp=list[i].Name;
  //       tmp.add(list[i]);
  //       nestedlist=tmp;
  //       // map[data[i].date]=temp1;
  //      }
  //    }
  //   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          child: Form(
              key: formKey,
              child: Column(children: <Widget>[
                Container(
                  height: 80,
                  width: 400,
                  margin: EdgeInsets.only(top: 50),
                  child: TextFormField(
                    controller: _NameController,
                    style: TextStyle(color: Colors.blue),
                    validator: (val) =>
                    (val.length == 0 ? "Please College name" : null),
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_sharp,
                        color: Colors.blue,
                      ),
                      enabledBorder: _borderDesign(),
                      focusedBorder: _borderDesign(),
                      errorBorder: _borderDesign(),
                      focusedErrorBorder: _borderDesign(),
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your College name',
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                    onSaved: (value){

                    },
                  ),
                ),
                Container(
                  height: 80,
                  width: 400,
                  margin: EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _StudentController,
                    style: TextStyle(color: Colors.blue),
                    validator: (val) =>
                    (val.length == 0 ? "Please Enter Your Name" : null),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.wc,
                          color: Colors.blue,
                        ),
                        enabledBorder: _borderDesign(),
                        focusedBorder: _borderDesign(),
                        errorBorder: _borderDesign(),
                        focusedErrorBorder: _borderDesign(),
                        //   border: OutlineInputBorder(),
                        labelText: 'Enter Your Name',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                ),
                Column(children: [
                  //  height: 80,
                  // width:400,
                  //  margin: EdgeInsets.only(top: 15),


                ]),
                Container(
                  height: 60,
                  width: 220,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                        side: BorderSide(color: Colors.blue, width: 1)),
                    child: Text(
                      'ADD',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      onSubmit();
                     //nestedlistdata();
                      //  getCheckboxItems();
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          // decoration: BoxDecoration(
                          //     border: Border.all(color: Colors.black)),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                  child:
                                  Text('College:${list[index].Name}'),
                                  padding: EdgeInsets.all(8.0)),
                              Container(
                                // decoration: BoxDecoration(
                                //     border: Border.all(color: Colors.black)),
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount: list.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    //print("Building block $blockIdx child $childIdx");
                                    return Padding(
                                      child: Text('Name:${list[index].Student}'),
                                      padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 8.0,
                                          top: 8.0,
                                          bottom: 8.0),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ])),
        ));
  }


}
