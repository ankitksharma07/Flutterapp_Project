import 'package:flutter/material.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';
import 'package:flutter_app/fisrtpack/Formpage.dart';
import 'package:flutter_app/fisrtpack/tabbar.dart';
import 'package:flutter_app/fisrtpack/progress.dart';

void main() {
  runApp(newdrawer());
}

class newdrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: drawerdata(),
    );
  }
}

class drawerdata extends StatefulWidget {
  @override
  _drawerdataState createState() => _drawerdataState();
}

class _drawerdataState extends State<drawerdata> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MultiLevelDrawer(

          backgroundColor: Colors.brown[300],
          rippleColor: Colors.white,
          subMenuBackgroundColor: Colors.lightBlue.shade100,
          header: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white, Colors.brown],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            // Header for Drawer
            //height: 40,
           // width: 100,
            child: Center(child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('images/Ankit2.jpg'),
                ),
                SizedBox(height: 10,),
                Text("Ankit Sharma")
              ],
            )),
          ),

          children: [

            MLMenuItem(

                leading: Icon(Icons.person),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "My Profile",
                ),
                subMenuItems: [
                  MLSubmenu(
                      onClick: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Contact())), submenuContent: Text("FormaPage")),
                  MLSubmenu(
                      onClick: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => tab1())), submenuContent: Text("TabPage")),
                  MLSubmenu(
                      onClick: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProgressData ())), submenuContent: Text("Progressbar")),
                ],
                onClick: () {}),
            MLMenuItem(
                leading: Icon(Icons.settings),
                trailing: Icon(Icons.arrow_right),
                content: Text("Settings"),
                onClick: () {},
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2"))
                ]),
            MLMenuItem(
              leading: Icon(Icons.notifications),
              content: Text("Notifications"),
              onClick: () {},
            ),
            MLMenuItem(
                leading: Icon(Icons.payment),
                trailing: Icon(Icons.arrow_right),
                content: Text(
                  "Payments",
                ),
                subMenuItems: [
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 1")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 2")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 3")),
                  MLSubmenu(onClick: () {}, submenuContent: Text("Option 4")),
                ],
                onClick: () {}),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Multi Level Menu",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient:
              LinearGradient(begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(255, 65, 108, 1.0),
                    Color.fromARGB(150, 170, 130, 4),
                  ]),
            ),
            child: Center()),
      ),

    );
  }
}
