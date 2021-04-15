import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';

//import 'package:flutter_app/fisrtpack/Formpage.dart';
//import 'package:flutter_app/fisrtpack/liststudent.dart';
//import './fisrtpack/FirstScreen.dart';
import './fisrtpack/tabbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
    );
  }
}

class User {
  final String Email, Password;

  const User({
    this.Email,
    this.Password,
  });
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: new Row(
      children: [
        CircularProgressIndicator(),
        Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _emailController = new TextEditingController();
  var _passwordController = new TextEditingController();

  GlobalKey<FormState> _keyLoader = GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  String _email, _password;

  _borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide(color: Colors.red),
    );
  }

  toastmsg() {
    Toast.show("Login Unsuccessful", context,
        gravity: Toast.BOTTOM,
        textColor: Colors.black,
        duration: 3,
        backgroundColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        child: Stack(children: <Widget>[
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: 'New User',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                    TextSpan(
                        text: '? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w900)),
                    TextSpan(
                        text: 'Sign UP ',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ),
          Container(
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(children: <Widget>[
                      Container(
                        height: 190,
                        width: 411.2,
                        decoration: new BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.elliptical(
                                  MediaQuery.of(context).size.width, 180.0)),
                        ),
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: AssetImage('images/Ankit2.jpg'),
                            )),
                      )
                    ]),
                  ),
                  SizedBox(height: 60),
                  Container(
                    alignment: Alignment.center,
                    //  margin: EdgeInsets.only(top: 60.0, left: 150),
                    child: Text(
                      'Welcome!',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  // SizedBox(height:20),
                  Container(
                    alignment: Alignment.center,
                    // margin: EdgeInsets.only(left: 130),
                    child: Text(
                      'Sign in to continue',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  Container(
                      height: 80,
                      width: 360,
                      child: TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'Mail Id',
                          hintStyle:
                              TextStyle(color: Colors.black, fontSize: 15),
                          filled: true,
                          // fillColor: Colors.black12,
                          prefixIcon: Icon(
                            Icons.person_sharp,
                            color: Colors.black54,
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
                        onSaved: (mail) {
                          _email = mail;
                        },
                      )),

                  SizedBox(height: 10.0),
                  Container(
                      width: 360,
                      height: 80,
                      // margin: EdgeInsets.only(left: 48, top: 10),
                      // padding: EdgeInsets.only(top: 10.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value.isEmpty) {
                            return ("Password is Empty");
                          }
                          if (value.length < 6) {
                            return "Password is to sort Minimum size is 6 digits";
                          }
                          return null;
                        },
                        /* onSaved: (val) => _password = val,
                        validator: (val) =>
                        val.length < 6 ? "password is to sort" : null,*/
                        controller: _passwordController,
                        autocorrect: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.black),
                          filled: true,
                          //fillColor: Colors.black12,
                          prefixIcon:
                              Icon(Icons.lock_sharp, color: Colors.black54),
                          enabledBorder: _borderDesign(),
                          focusedErrorBorder: _borderDesign(),
                          errorBorder: _borderDesign(),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                        ),
                      )),

                  Container(
                    width: 250,
                    height: 45,
                    //   margin: EdgeInsets.only(top: 65),
                    child: RaisedButton(
                      color: Colors.red,
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(color: Colors.white, fontSize: 15.0),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        // toastmsg();
                        if (formKey.currentState.validate()) {
                          var route = new MaterialPageRoute(
                            builder: (BuildContext context) => new tab1(
                              //   value: User(
                              // Email: _emailController.text,
                              // Password: _passwordController.text,
                            ));
                          Navigator.of(context).push(route);
                          //   toastmsg();
                          Toast.show(
                              "Welcome Your Login is Successful", context,
                              duration: Toast.LENGTH_LONG,
                              gravity: Toast.CENTER,
                              textColor: Colors.white,
                              backgroundColor: Colors.blue);
                        } else {
                          toastmsg();
                          // Toast.show("Login Unsuccessful", context, duration: Toast.LENGTH_LONG,
                          //   gravity:  Toast.BOTTOM,textColor: Colors.blue ,backgroundColor: Colors.white);

                        }
                        _emailController.clear();
                        _passwordController.clear();
                      },
                    ),
                  ),
                  SizedBox(height: 30),

                  SizedBox(height: 30),
                  // RaisedButton(
                  //   color: Colors.red,
                  //   child: Text(
                  //     "TabScreen",
                  //     style: TextStyle(color: Colors.white),
                  //   ),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(18.0),
                  //   ),
                  //   onPressed: () {
                  //     gotostack2(context);
                  //   },
                  // ),
                ],
              ),
            ),
          ),
          Positioned(
              top: 102,
              left: 230,
              child: Container(
                height: 23,
                width: 23,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.red,
                      width: 2.5,
                    )),
              )),
        ]),
      ),
    );
  }
}


Future gotostack2(context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => tab1()));
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
