import 'dart:async';

import 'package:flutter/material.dart';
void main()=>runApp(new Contact());
class Contact extends StatelessWidget{
  static const String routeName = '/contact';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //unselectedWidgetColor: Colors.red, // <-- your color
      ),
      home:Scaffold(
        resizeToAvoidBottomPadding: false,
      //     appBar: AppBar(
      //       title: Text(
      //           "Contact Page"
      //       ),
      //
      // )

       body: formpage(),
      ),
    );
  }

}
class Item {
  const Item(this.name);
  final String name;
 // final Icon icon;
}

class User {
  final String Email, Name,Number,Area,Address,City,State,Pincode,Dob;

  const User({
    this.Email,
    this.Name,
    this.Number,
    this.Area,
    this.Address,
    this.City,
    this.State,
    this.Pincode,
    this.Dob,


  });
}

class formpage extends StatefulWidget {
  @override
  _formpageState createState() => _formpageState();
  // State createState() => State();
}
_borderDesign() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(50.0)),
    borderSide: BorderSide(color: Colors.blue),
  );
}




class _formpageState extends State<formpage> {



  Item selectedUser;
  List<Item> users = [
    const Item('Paldi'),
    const Item('Thaltej'),
    const Item('Gota'),
    const Item('Vadaj'),
  ];
  String _radioValue; //Initial definition of radio button value
  String choice;

  bool cricket = false;
  bool Dance = false;
  bool tennis = false;

  void radioButtonChanges(String value) {
    setState(() {
      _radioValue = value;
      switch (value) {
        case 'one':
          choice = value;
          break;
        case 'two':
          choice = value;
          break;
        default:
          choice = null;
      }
     // debugPrint(choice); //Debug the choice in console
    });
  }

  var _emailController = new TextEditingController();
  var _nameController = new TextEditingController();
  var _numberController = new TextEditingController();
  var _areaController = new TextEditingController();
  var _addressController = new TextEditingController();
  var _cityController = new TextEditingController();
  var _stateController = new TextEditingController();
  var _pincodeController = new TextEditingController();
  var _dobController = new TextEditingController();

  final formKey = new GlobalKey<FormState>();
  String _email, _name,_gender,_number,_area,_address,_city, _state, _pincode, _dob;
  String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
     body:Container(
       child:Stack(
         children: [
           Form(
              key:formKey,
              child:Column(
             children: <Widget>[
                  //   SizedBox(height: 20),
                    Container(

                         height: 80,
                         width:400,
                         margin: EdgeInsets.only(top: 15),
                          child: TextFormField(
                          controller: _emailController,
                           keyboardType: TextInputType.text,
                           decoration: InputDecoration(
                             hintText: 'Enter Mail Id',
                             hintStyle:
                             TextStyle(color: Colors.lightBlue, fontSize: 15),

                             // fillColor: Colors.black12,
                             prefixIcon: Icon(
                               Icons.attach_email,
                               color: Colors.lightBlue,
                             ),
                             enabledBorder: _borderDesign(),
                             focusedBorder: _borderDesign(),
                             errorBorder: _borderDesign(),
                             focusedErrorBorder: _borderDesign(),

                           ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Please Enter Mail";
                              }
                              if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value)) {
                                return "Please Enter Valid Mail Format";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _email = value;
                            },

                         )),
                       //  SizedBox(height: 10),
                         Container(
                             height: 80,
                             width:400,
                          //   margin: EdgeInsets.only(top:3),
                             child: TextFormField(
                               controller: _nameController,
                               keyboardType: TextInputType.text,
                               decoration: InputDecoration(
                                 hintText: 'Enter Name',
                                 hintStyle:
                                 TextStyle(color: Colors.lightBlue, fontSize: 15),

                                 // fillColor: Colors.black12,
                                 prefixIcon: Icon(
                                   Icons.person_sharp,
                                   color: Colors.lightBlue,
                                 ),
                                 enabledBorder: _borderDesign(),
                                 focusedBorder: _borderDesign(),
                                 errorBorder: _borderDesign(),
                                 focusedErrorBorder: _borderDesign(),

                               ),
                              validator: (value) {
                                 if (value.isEmpty) {
                                   return "Please Enter Name";
                                 }
                                 return null;
                                 },
                                onSaved: (value) {
                             _name = value;
                           },
                             )

                         ),


               Container(

                 child: Row(
                   children: <Widget>[
                     Container(

                      margin: EdgeInsets.only(left: 20),
                        child:Text('Hobbies:',style: TextStyle(fontSize: 17,color:Colors.lightBlue),),
                     ),
                     Container(
                       width: 315,
                       height: 80,

                       child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: <Widget>[
                           Checkbox(
                             // checkColor: Colors.greenAccent,
                             activeColor: Colors.blue,
                             value: this.cricket,
                             onChanged: (bool value) {
                               setState(() {
                                 this.cricket = value;
                               });
                             },
                           ),
                           Text('Dance',style: TextStyle(fontSize: 17,color:Colors.lightBlue),),
                           Checkbox(

                             // checkColor: Colors.greenAccent,
                             activeColor: Colors.blue,
                             value: this.Dance,
                             onChanged: (bool value) {
                               setState(() {
                                 this.Dance = value;
                               });
                             },
                           ),
                           Text('Cricket',style: TextStyle(fontSize: 17,color:Colors.lightBlue),),
                           Checkbox(

                             //checkColor: Colors.greenAccent,
                             activeColor: Colors.blue,
                             value: this.tennis,
                             onChanged: (bool value) {
                               setState(() {
                                 this.tennis = value;
                               });
                             },
                           ),
                           Text('Tennis',style: TextStyle(fontSize: 17,color:Colors.lightBlue),),
                         ],
                       ),
                     ),
                       ],
                 ),
               ),
                         Row(

                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: <Widget>[


                              Container(
                               //margin: EdgeInsets.only(top:10),
                              // height: 84,
                              // width:150,
                               child:Text(
                                 "Select Gender:",
                                  style: TextStyle(fontSize: 17,color:Colors.lightBlue),
                               )),
                             Radio(
                                 value: 'male',
                                 groupValue: _radioValue,
                                 onChanged: radioButtonChanges,
                               ),
                             Text(
                               "Male",
                               style: TextStyle(fontSize: 17,color:Colors.lightBlue),
                             ),
                             Radio(
                               focusColor: Colors.lightBlue,
                               value: 'female',
                               groupValue: _radioValue,
                               onChanged: radioButtonChanges,
                             ),
                             Text(
                               "Female",
                               style: TextStyle(fontSize: 17,color:Colors.lightBlue),
                             ),
                           ]),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Container(
                                  height: 84,
                                   width:195,
                                 child: TextFormField(
                                    controller: _numberController,
                                   keyboardType: TextInputType.text,
                                   decoration: InputDecoration(
                                     hintText: 'Enter Number',
                                     hintStyle:
                                     TextStyle(color: Colors.lightBlue, fontSize: 15),

                                     // fillColor: Colors.black12,
                                     prefixIcon: Icon(
                                       Icons.add_call,
                                       color: Colors.lightBlue,
                                     ),
                                     enabledBorder: _borderDesign(),
                                     focusedBorder: _borderDesign(),
                                     errorBorder: _borderDesign(),
                                     focusedErrorBorder: _borderDesign(),

                                   ),
                                   validator: (value) {
                                     if (value.isEmpty) {
                                       return "Please Enter Number";

                                     }if(value.length>10){
                                       return "Please Enter Atleast 10 digits";
                                     }
                                     return null;
                                     },
                                 onSaved: (value) {
                                     _number = value;
                                   },
                                 )

                             ),
                              Container(
                                margin: EdgeInsets.only(bottom: 5),
                                 height:85,
                                 width:200,

                                   //child: TextFormField(
                                   child:DropdownButtonFormField(
                                     validator: (value) => value == null
                                         ? 'Please Select Area' : null,
                                     decoration: InputDecoration(
                                         enabledBorder: _borderDesign(),
                                         focusedBorder: _borderDesign(),
                                         errorBorder: _borderDesign(),
                                         focusedErrorBorder: _borderDesign(),


                                         hintStyle: TextStyle(color: Colors.lightBlue),
                                         hintText: "Your Area",
                                        //fillColor: Colors.grey[20],

                                     ),
                                   value: selectedUser,
                                    onChanged: (Item Value) {
                                      setState(() {
                                        selectedUser = Value;
                                      });
                                    },
                                    items: users.map((Item user) {
                                      return  DropdownMenuItem<Item>(
                                        value: user,
                                        child: Row(
                                          children: <Widget>[
                                            //user.icon,
                                            SizedBox(width: 10,),
                                            Text(
                                              user.name,
                                              style:  TextStyle(color: Colors.black),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),

                                      /* validator: (value) {
                                         if (value.isEmpty) {
                                           return "Please Enter Area";

                                         }
                                         return null;
                                         },*/
                                      onSaved: (value) {
                                        _area  = value;
                                       },

                                     ),


                               )
                           ],
                         ),



                        /* Container(
                             height:80,
                             width:395,
                             child: TextFormField(
                                controller: _cityController,
                               keyboardType: TextInputType.text,
                               decoration: InputDecoration(
                                 hintText: 'Enter City',
                                 hintStyle:
                                 TextStyle(color: Colors.black, fontSize: 15),
                                 filled: true,
                                 // fillColor: Colors.black12,
                                /* prefixIcon: Icon(
                                   Icons.add_location_alt_outlined,
                                   color: Colors.black54,
                                 ),*/
                                 enabledBorder: _borderDesign(),
                                 focusedBorder: _borderDesign(),
                                 errorBorder: _borderDesign(),
                                 focusedErrorBorder: _borderDesign(),

                               ),
                               validator: (value) {
                                 if (value.isEmpty) {
                                   return "Please Enter City";

                                 }
                                 return null;
                                 },
                               onSaved: (value) {
                                 _city= value;
                               },


                             )
                         ),*/
               //SizedBox(height: 17),

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                       height: 80,
                       width:195,
                       child: TextFormField(
                           controller: _stateController,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: 'Enter State',
                           hintStyle:
                           TextStyle(color: Colors.lightBlue, fontSize: 15),

                           // fillColor: Colors.black12,
                          /* prefixIcon: Icon(
                             Icons.add_call,
                             color: Colors.black54,
                           ),*/
                           enabledBorder: _borderDesign(),
                           focusedBorder: _borderDesign(),
                           errorBorder: _borderDesign(),
                           focusedErrorBorder: _borderDesign(),

                         ),
                         validator: (value) {
                           if (value.isEmpty) {
                             return "Please Enter State";

                           }
                           return null;
                           },
                         onSaved: (value) {
                           _state= value;
                         },


                       )

                   ),
                   Container(
                       height:80,
                       width:200,
                       child: TextFormField(
                          controller: _pincodeController,
                         keyboardType: TextInputType.text,
                         decoration: InputDecoration(
                           hintText: 'Enter Pincode',
                           hintStyle:
                           TextStyle(color: Colors.lightBlue, fontSize: 15),
                            // filled: true,
                           // fillColor: Colors.black12,
                          /* prefixIcon: Icon(
                             Icons.add_location_alt_outlined,
                             color: Colors.black54,
                           ),*/
                           enabledBorder: _borderDesign(),
                           focusedBorder: _borderDesign(),
                           errorBorder: _borderDesign(),
                           focusedErrorBorder: _borderDesign(),

                         ),
                         validator: (value) {
                           if (value.isEmpty) {
                             return "Please Enter Pincode";

                           }
                           return null;
                           },
                         onSaved: (value) {
                           _pincode= value;
                         },

                       )
                   )
                 ],
               ),
              // SizedBox(height: 17),
               /*Container(
                   height:80,
                   width:395,
                   child: TextFormField(
                      controller: _dobController,
                     keyboardType: TextInputType.text,
                     decoration: InputDecoration(
                       hintText: 'Enter Birthdate',
                       hintStyle:
                       TextStyle(color: Colors.black, fontSize: 15),
                       filled: true,
                       // fillColor: Colors.black12,
                        prefixIcon: Icon(
                                   Icons.calendar_today_sharp ,
                                   color: Colors.black54,
                                 ),
                       enabledBorder: _borderDesign(),
                       focusedBorder: _borderDesign(),
                       errorBorder: _borderDesign(),
                       focusedErrorBorder: _borderDesign(),

                     ),
                    validator: (value) {
                       if (value.isEmpty) {
                         return "Please Enter Birth Date";

                       }
                       return null;
                       },
                     onSaved: (value) {
                       _dob= value;
                     },

                   )

               ),*/
               //SizedBox(height: 17),
               Container(
                 width: 250,
                 height: 45,
                 //   margin: EdgeInsets.only(top: 65),
                 child: RaisedButton(

                   color: Colors.lightBlue,
                   child: Text(
                     'Save',
                     style: TextStyle(color: Colors.white, fontSize: 15.0),
                   ),
                   shape: RoundedRectangleBorder(
                     borderRadius: new BorderRadius.circular(18.0),
                   ),
                   onPressed: () {


                     if (formKey.currentState.validate()) {
                        var route = new MaterialPageRoute(
                          builder: (BuildContext context) =>
                          new SecondPage(
                              value: User(
                                Email: _emailController.text,
                                Name: _nameController.text,
                                Number: _numberController.text,
                                Area: _areaController.text,
                                Address: _addressController.text,
                                City: _cityController.text,
                                State: _stateController.text,
                                Pincode: _pincodeController.text,
                                Dob: _dobController.text,

                              )),
                        );
                        Navigator.of(context).push(route);
                      }
                      else
                        {
                     print("Login Unsuccessful");
                       }
                     }
                   ),
               ),
             ],
                   ),
                 ),
         ],
       ),
         ),
    );
  }
}
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
              /*   RaisedButton(
          child:Text("Stack Screen"),
          onPressed: (){
            gotostack(context);
          },),*/
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
                  'Your Name: ${widget.value.Name}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your Phone Number: ${widget.value.Number}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your Area: ${widget.value.Area}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your Address: ${widget.value.Address}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your City : ${widget.value.City}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your State: ${widget.value.State}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your Area Pincode: ${widget.value.Pincode}',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Your BirthDate: ${widget.value.Dob}',
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


