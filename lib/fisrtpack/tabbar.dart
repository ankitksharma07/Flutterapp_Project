
import 'package:flutter_app/ClassDatabse/MethodStore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DataBaseDemo/ShowData.dart';
import 'package:flutter_app/fisrtpack/Formpage.dart';
import 'package:flutter_app/fisrtpack/cardscreen.dart';
import 'package:flutter_app/fisrtpack/liststudent.dart';
import 'package:flutter_app/fisrtpack/FirstScreen.dart';
import 'package:flutter_app/fisrtpack/progress.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:flutter_app/fisrtpack/nestedlist.dart';
import 'package:flutter_app/fisrtpack/mapdata.dart';
import 'package:flutter_app/fisrtpack/sliderexample.dart';
import 'package:flutter_app/fisrtpack/jsondata.dart';
import 'package:flutter_app/fisrtpack/postdata.dart';
import 'package:flutter_app/fisrtpack/putAPI.dart';
import 'package:flutter_app/Flutter API/newpostfile.dart';
import 'package:flutter_app/Flutter API/deleteapi.dart';
import 'package:flutter_app/Flutter API/loginfrom.dart';


void main() => runApp(tab1());

class tab1 extends StatelessWidget {




  @override
  Widget build(BuildContext context) {


    Rauting(Name, file) {
      return MLSubmenu(
          onClick: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => file)),
          submenuContent: Text(Name ,style:TextStyle(color:Colors.white)));
    }

    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    return MaterialApp(
      // initialRoute: "/",
      // routes: {
      //   // "/first": (context) => Contact(),
      //   // When we navigate to the "/second" route, build the SecondScreen Widget
      //   // '/second': (context) => ProgressData(),
      // },
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('Flutter Tabs Demo'),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.apps),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            //title: Text('Flutter Tabs Demo'),

            bottom: TabBar(
              unselectedLabelColor: Colors.white,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black54),
              //isScrollable: true,
              tabs: [
                //Tab(icon: Icon(Icons.list), text: "Tab 5"),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 1.5)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("UserForm"),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 2)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.list),
                        Text("List Data"),
                      ],
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.white, width: 2)),
                    // child:Text("GAMES"),
                    // color: Colors.deepOrangeAccent,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        Text("CardView"),
                        Container(
                          child: Row(children: <Widget>[]),
                        )
                      ],
                    ),
                  ),
                ),

                //Tab(icon: Icon(Icons.list), text: "Tab 5"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Contact(),
              liststudent(),
              cardData(),
              //cardData(),
              // cardData(),
            ],
          ),
          drawer: MultiLevelDrawer(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(250, 100, 150, 220),
                  Color.fromARGB(230, 150, 140, 150)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),

              // backgroundColor: Colors.brown[300],
              rippleColor: Colors.white,
              subMenuBackgroundColor: Color.fromARGB(250, 100, 150, 220),
              header: Container(
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   colors: [Colors.white, Colors.brown],
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    // ),
                    ),
                // Header for Drawer
                //height: 40,
                // width: 100,
                child: Center(
                    child: Container(
                      margin: EdgeInsets.only(top:40),
                      child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('images/Ankit2.jpg'),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Ankit Sharma",style:TextStyle(color:Colors.white)),
                  ],
                ),
                    )),
              ),
              children: [
                MLMenuItem(
                    leading: IconButton(
                      tooltip: 'Profile',
                      icon: Icon(Icons.account_circle_outlined,color:Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_right,color:Colors.white),
                    content: Text(
                      "My Profile",style:TextStyle(color:Colors.white)
                    ),
                    subMenuItems: [
                      Rauting('first ', ProgressData(),),
                      Rauting('FormaPage', Contact()),
                      Rauting('TabPage', tab1()),
                    ],
                    onClick: () {}),
                MLMenuItem(
                    leading: IconButton(
                      tooltip: 'Settings',
                      icon: Icon(Icons.settings,color:Colors.white),
                    ),
                    trailing: Icon(Icons.arrow_right,color:Colors.white),
                    content: Text("Settings",style:TextStyle(color:Colors.white)),
                    onClick: () {},
                    subMenuItems: [
                      Rauting('nestedlist', nestedlist()),
                      Rauting('nestedmap', Mapdata()),
                      Rauting('newform', NewTask()),
                    ]),
                MLMenuItem(
                  leading: IconButton(
                    tooltip: 'PaymentDetails',
                    icon: Icon(Icons.drive_file_rename_outline,color:Colors.white),
                  ),
                  trailing: Icon(Icons.arrow_right,color:Colors.white),
                  content: Text(
                    "Database",style:TextStyle(color:Colors.white),
                  ),
                  subMenuItems: [
                    Rauting('SqliteDatabase1',  ShowDataDataBase()),


                  ],
                ),
                MLMenuItem(
                  leading: IconButton(
                    tooltip: 'PaymentDetails',
                    icon: Icon(Icons.article_outlined,color:Colors.white),
                  ),
                  trailing: Icon(Icons.arrow_right,color:Colors.white),
                  content: Text(
                    "Payments",style:TextStyle(color:Colors.white),
                  ),
                  subMenuItems: [
                    Rauting('Gridview', GridViewdata()),
                    Rauting('Slider', Sliderdata()),
                    Rauting('JsonGetAPI', Jsonexample()),
                    Rauting('JsonPostAPI', newpostdata()),
                    Rauting('JsonPutAPI', PutData()),
                    Rauting('Post1API', NewPostfile()),
                    Rauting('DeleteAPI', DeleteApiPage()),
                  ],
                  //  onClick: () {}),
                )
              ]),
          // drawer: Drawer(
          //   child: Container(
          //     decoration: BoxDecoration(0
          //       gradient: LinearGradient(
          //         colors: [Colors.white, Colors.brown],
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //       ),
          //     ),
          //     child: ListView(
          //       // Important: Remove any padding from the ListView.
          //       padding: EdgeInsets.zero,
          //       children: <Widget>[
          //         DrawerHeader(
          //             decoration: BoxDecoration(
          //                 color: Colors.brown
          //             ),
          //             child: Container(
          //               child: Column(
          //                 children: <Widget>[
          //                   Material(
          //                     borderRadius: BorderRadius.all(Radius.circular(50.0)),
          //                     elevation: 10,
          //
          //                       child:CircleAvatar(
          //                         radius: 50,
          //                         backgroundImage: AssetImage('images/Ankit2.jpg'),
          //                       ),
          //                     ),
          //
          //                   Text('Flutter', style: TextStyle(color: Colors.white, fontSize: 25.0),)
          //                 ],
          //               ),
          //             )),
          //         ListTile(
          //           leading: CircleAvatar(
          //             radius: 17,
          //               backgroundImage:NetworkImage('https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX5536271.jpg')
          //           ),
          //
          //          // leading: Icon(Icons.home,color: Colors.white),
          //           title: Text("Home"),
          //           //subtitle: Text("hello"),
          //           onTap: () => Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => stack())),
          //           //  Navigator.pop(context);
          //         ),
          //         ListTile(
          //             leading: CircleAvatar(
          //                 radius: 17,
          //                 backgroundImage:NetworkImage('https://thumbs.dreamstime.com/z/brown-setting-icon-rusty-cogwheel-white-background-77926841.jpg')
          //             ), title: Text("Settings"),
          //           onTap: () => Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => GridViewdata())),
          //           // Navigator.pushReplacementNamed(context, Routes.listData),
          //           //
          //         ),
          //         ListTile(
          //           leading: CircleAvatar(
          //               radius: 17,
          //               backgroundImage:NetworkImage('https://media.istockphoto.com/vectors/vector-wooden-app-icon-with-progress-bar-vector-id459875133?s=612x612')
          //           ), title: Text("Progress"),
          //           onTap: () => Navigator.push(context,
          //               MaterialPageRoute(builder: (context) => ProgressData())),
          //           // Navigator.pushReplacementNamed(context, Routes.listData),
          //           //
          //         ),
          //         ListTile(
          //             leading: CircleAvatar(
          //                 radius: 17,
          //                 backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuWd_y1wX_cfcfMckucKqdU9ZdY0jvjRxN6w&usqp=CAU')
          //             ), title: Text("Contact Us"),
          //           onTap: () => Navigator.push(
          //               context, MaterialPageRoute(builder: (context) => Data())),
          //           //  Navigator.pushReplacementNamed(context, Routes.card),
          //         ),
          //         ListTile(
          //           leading: CircleAvatar(
          //               radius: 17,
          //               backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiZAHgZH5Kfw1Kxy6-oPqE3Os0KKzAuZ4jMQ&usqp=CAU')
          //           ),
          //           title: Text('Close'),
          //           onTap: () => Navigator.push(
          //               context, MaterialPageRoute(builder: (context) => tab1())),
          //         ),
          //         ListTile(
          //           leading: CircleAvatar(
          //               radius: 17,
          //               backgroundImage:NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiZAHgZH5Kfw1Kxy6-oPqE3Os0KKzAuZ4jMQ&usqp=CAU')
          //           ),
          //           title: Text('Multilevel_Drawer'),
          //           onTap: () => Navigator.push(
          //               context, MaterialPageRoute(builder: (context) => newdrawer())),
          //         )
          //       ],
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}

class Data extends StatelessWidget {
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
                  'Ankit Sharma',
                  style: new TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Padding(
                child: new Text(
                  'Flutter Trainee',
                  style: new TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                padding: EdgeInsets.all(10.0),
              ),
              Padding(
                child: new Text(
                  'Tech Compose',
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

class GridViewdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter GridView Demo"),
      ),
      body: Griddata(),
    );
  }
}

class Griddata extends StatefulWidget {
  @override
  _GriddataState createState() => _GriddataState();
}

class _GriddataState extends State<Griddata> {
  TextEditingController _dateController = TextEditingController();

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
    DataStore data = new DataStore();
    return Scaffold(
      body: Center(
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 50,
            mainAxisSpacing: 50,
            maxCrossAxisExtent: 170.0,
            children: <Widget>[
              new GestureDetector(
                  onTap: () {
                    _selectDate(context);
                  },
                  child: new Container(
                    //width: 500.0,
                    //padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: new Column(children: [
                      new Text(
                        "Calendar",
                        style: TextStyle(fontSize: 20),
                      ),
                      // style: TextStyle(color:Colors.white,fontSize: 20),),
                      data.Imagedata('https://www.clipartkey.com/mpngs/m/169-1696786_calendar-icon-blue-png.png', 100.0, 132.0),
                    ]),
                  )),
              //https://cdn.iconscout.com/icon/free/png-512/calculator-717-461704.png
              new GestureDetector(
                  onTap: () {},
                  child: new Container(
                    //width: 500.0,
                    //padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: new Column(children: [
                      new Text(
                        "Calculator",
                        style: TextStyle(fontSize: 20),
                      ),

                      data.Imagedata(
                          'https://cdn.iconscout.com/icon/free/png-512/calculator-717-461704.png', 124.0, 127.0),
                      ]),
                  )),
              Container(
                // width: 150,
                // height: 250,
                  padding: const EdgeInsets.all(12),
                  color: Colors.white,
                  child: new Column(children: [
                    //  padding: const EdgeInsets.all(8),
                    Text('Flutter', style: TextStyle(fontSize: 20)),
                    //color: Colors.lightBlue,
                  // data.Imagedata('images/flutter.png', 70.0,100.0),
                    Image.asset('images/flutter.png',
                        width: 70, height: 100, fit: BoxFit.fill),
                  ])),
              new GestureDetector(
                  onTap: () {
                    gotostack2(context);
                  },
                  child: new Container(
                    //width: 500.0,
                    padding: const EdgeInsets.all(8),
                    color: Colors.white,
                    child: new Column(children: [
                      new Text("Profile", style: TextStyle(fontSize: 20)),
                      //  style: TextStyle(color:Colors.white,fontSize: 15),),
                      data.Imagedata(
                          'https://p.kindpng.com/picc/s/11-117151_request-form-icon-png-download-application-form-icon.png', 140.0, 120.0),
                    ]),

                  )  ),]

    )));
  }


  Future gotostack2(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
  }

/*class Choice {
  const Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Home', icon: Icons.home),
  const Choice(title: 'Contact', icon: Icons.contacts),
  const Choice(title: 'Map', icon: Icons.map),
  const Choice(title: 'Phone', icon: Icons.phone),
  const Choice(title: 'Camera', icon: Icons.camera_alt),
  const Choice(title: 'Setting', icon: Icons.settings),
  const Choice(title: 'Album', icon: Icons.photo_album),
  const Choice(title: 'WiFi', icon: Icons.wifi),
  const Choice(title: 'Calendar', icon: Icons.date_range_sharp),
];

class SelectCard extends StatelessWidget {
  const SelectCard({Key key, this.choice}) : super(key: key);
  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
       shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(30),
       ) ,
        color: Colors.lightBlue,
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(choice.icon, size:50.0, color: Colors.white)),
              Text(choice.title, style: TextStyle(fontSize: 17,color: Colors.white)),
            ]
        ),
        )
    );
  }
}
*/
}