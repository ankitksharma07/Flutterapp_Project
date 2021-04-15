import 'package:flutter/material.dart';

void main() => runApp(new Mapdata());

class Mapdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Demo {
  String title;
  String date;
  String time;

  Demo(title, date, time) {
    this.title = title;

    this.date = date;

    this.time = time;
  }
}

class _MyHomePageState extends State<MyHomePage> {
//  List<Demo> data = [];
  //data.add(Demo('Morning Walk',"2/2/2020","7am"));
  List<Demo> list = [
    Demo('Morning Walk', "2/2/2020", "7am"),
    Demo('Dance', "3/2/2020", "8am"),
    Demo('office', "4/2/2020", "8am"),
    Demo('gym', "2/2/2020", "7am"),
    Demo('meditation', "3/2/2020", "7am"),
    Demo('yoga', "6/2/2020", "7am"),
    Demo('lunch', "6/2/2020", "2pm"),
  ];

  @override
  initState() {
    super.initState();
    // maplist();
  }

  maplistdata() {
    int i;
    for ( i = 0; i <list.length; i++) {

      if ( map[list[i].date ]== null )
      {
        List<Demo> temp= [];
        temp.add(list[i]);
        map[list[i].date]=temp.toList();

      }
      else
      {

        var temp1=map[list[i].date];
        temp1.add(list[i]);
        map[list[i].date]=temp1.toList();
      }

    }
    }


 // Map<String, Map<String, List<Demo>>> map = {};
   Map<String, List<Demo>> map = {};

  @override
  Widget build(BuildContext context) {
    maplistdata();

    return Scaffold(
        appBar: AppBar(
          title: Text("Map ListViewBuilder"),
        ),
        backgroundColor: Colors.white,
        body: Stack(children: [
          Container(
            child: ListView.builder(
              itemCount: map.length,
              itemBuilder: (BuildContext context, int index) {
                String key = map.keys.elementAt(index);
                return Container(
                    child: Column(children: [
                  Text("${key} "),
                  ListView.builder(
                    itemCount: map[key].length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index
                        ) {
                      return Container(
                          child: Text(""
                              "${map[key][index].title} ")
                      );
                    },
                  ),

                ]));
              },
            ),
            //  children: [
            /*child: ListView.builder(
              itemCount: temp.length,
              itemBuilder: (BuildContext context, int index) {
                String key = temp.keys.elementAt(index);
                return new Column(
                  children: <Widget>[
                    new ListTile(
                      title: new Text("$key[key]"),
                      //subtitle: new Text("${temp[key]}"),
                    ),
                    ListView.builder(
                      itemCount: temp.length,
                      shrinkWrap :true,
                      itemBuilder: (BuildContext context, int index2){
                        String key = temp.keys.elementAt(index);
                         Container(
                          child:ListTile(
                            //title: new Text("$key"),
                            subtitle: new Text("${key}"),
                          ),

                        );
                      },
                    )
                  ],
                );
              },
            ),

      ), */

            // RaisedButton(
            //   color: Colors.red,
            //   child: Text('Save'),
            //   onPressed: (){
            //     maplist();
            //   },
            // ),
          ),
          Positioned(
            top: 350,
            left: 130,
            child: RaisedButton(
              color: Colors.red,
              child: Text('save'),
              onPressed: () {
                // maplist();
              },
            ),
          )
        ]));

    // child: ListView.builder(
    //     shrinkWrap: true,
    //     physics: NeverScrollableScrollPhysics(),
    //     itemCount: temp != null ? map.length : 0,
    //     itemBuilder: (BuildContext context, int index) {
    //       temp.values
    //           .toList()
    //           .map((value) => Text('Sports ${value}'))
    //           .toList();
    //     }),

    /* child:ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount:_profile!=null?_profile.length:0, itemBuilder:
    (BuildContext ctxt, int index) {
      return new Text('Sports${_profile[index].title}');})*/
  }
}
