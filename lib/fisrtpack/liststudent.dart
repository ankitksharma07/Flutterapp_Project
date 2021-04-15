import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new liststudent());


}

class liststudent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        // appBar: AppBar(
        //
        //   title: Text("List Page"),
        // ),
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
  String Name, age, Dob;
  List<String> list = [];

  User({this.Name, this.age, this.Dob, List list}) {
    this.list=list;

  }

}




class _listdataState extends State<listdata> {



  List<User> list = [];


  TextEditingController _dateController = TextEditingController();
  TextEditingController _NameController = TextEditingController();
  TextEditingController _AgeController = TextEditingController();

  Map<String, bool> values = {
    'Cooking': false,
    'Singing': false,
    'Dance': false,
    'Sports': false,
  };



  List<String> tmpArray = [];

  final formKey = new GlobalKey<FormState>();

  onSubmit() {
    var form = formKey.currentState;
    if (form.validate()) {
      list.add(User(
          Name: _NameController.text,
          age: _AgeController.text,
          Dob: _dateController.text,
          list: tmpArray.toList()));

      // Radiolist:RadioArray.toList();


         setState(() {});
       values = {
        'Cooking': false,
        'Singing': false,
        'Dance': false,
        'Sports': false,
      };
      tmpArray.clear();

      list.forEach((element) {

        element.list.forEach((element) {

        });
      });
    }
    // _dateController.clear();
    // _AgeController.clear();
    //  _NameController.clear();

  }

  //form.save();
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        selectedDate = picked;
        var date =
            "${picked.toLocal().day}/${picked.toLocal().month}/${picked.toLocal().year}";
        _dateController.text = date;
      });
  }



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
                  margin: EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _NameController,
                    style: TextStyle(color: Colors.blue),
                    validator: (val) =>
                        (val.length == 0 ? "Please Enter name" : null),
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
                      labelText: 'Enter Your Name',
                      labelStyle: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
                Container(
                  height: 80,
                  width: 400,
                  margin: EdgeInsets.only(top: 15),
                  child: TextFormField(
                    controller: _AgeController,
                    style: TextStyle(color: Colors.blue),
                    validator: (val) =>
                        (val.length == 0 ? "Please Enter Age" : null),
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
                        labelText: 'Enter Your Age ',
                        labelStyle: TextStyle(color: Colors.blue)),
                  ),
                ),
                Column(children: [
                  //  height: 80,
                  // width:400,
                  //  margin: EdgeInsets.only(top: 15),

                  GestureDetector(
                      onTap: () => _selectDate(context),
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: _dateController,
                          style: TextStyle(color: Colors.blue),
                          validator: (val) => (val.length == 0
                              ? "Please Enter Birthdate"
                              : null),
                          decoration: InputDecoration(
                            fillColor: Colors.lightBlue,
                            prefixIcon: Icon(
                              Icons.calendar_today_sharp,
                              color: Colors.lightBlue,
                            ),
                            enabledBorder: _borderDesign(),
                            focusedBorder: _borderDesign(),
                            errorBorder: _borderDesign(),
                            focusedErrorBorder: _borderDesign(),
                            border: OutlineInputBorder(),
                            labelText: 'Enter Your Date of Birth ',
                            labelStyle: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ))
                ]),




               Expanded(
                  child: ListView(
                   // scrollDirection: Axis.horizontal,
                    children: values.keys.map((String key) {
                      return CheckboxListTile(
                        title: new Text(key,style: TextStyle(color: Colors.lightBlue),),
                        value: values[key],
                        activeColor: Colors.pink,
                        checkColor: Colors.white,
                        onChanged: (bool value) {
                          setState(() {
                            values[key] = value;
                            if (value == true && !tmpArray.contains(key)) {
                              tmpArray.add(key);
                            } else {
                              if (tmpArray.contains(key)) tmpArray.remove(key);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                ),
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
                      // remove();
                      //  getCheckboxItems();
                    },
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount:list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.all(2),
                              //  color: msgCount[index]>=10? Colors.blue[400]:
                              //  msgCount[index]>3? Colors.blue[100]: Colors.grey,
                              // child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                //width: 200,
                                //  height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                // color: Colors.lightBlue[200],
                                child: ListTile(
                                  title: Text(
                                    ' Your Name is:-   ${list[index].Name}\n Your Age:-          ${list[index].age}\n'
                                    ' Your BirthDate:-${list[index].Dob} \n${list[index].list }  ',
                                    // '(${msgCount[index]})',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              ));
                        }))
              ])),
        ));
  }


}
