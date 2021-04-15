import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/fisrtpack/Service.dart';
import 'package:flutter_app/fisrtpack/jsondataclass.dart';
import 'package:http/http.dart' as http;
import '';

void main() {
  runApp(Jsonexample());
}

class Jsonexample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Json API Fatching"),
      ),
      body: JsonMainExample(),
    );
  }
}

// class Service {
//   static const String url = "https://jsonplaceholder.typicode.com/users";
//
//   static Future<List<Users>> getjsondataclass() async {
//     try {
//       final response = await http.get(url);
//       if (200 == response.statusCode) {
//         final List<Users> user = usersFromJson(response.body);
//         return user;
//       } else {
//         return List<Users>();
//       }
//     } catch (e) {
//       return List<Users>();
//     }
//   }
// }

class JsonMainExample extends StatefulWidget {
  @override
  _JsonMainExampleState createState() => _JsonMainExampleState();
}

class _JsonMainExampleState extends State<JsonMainExample> {
  Service data= new Service();
 // List<Data> _Users=[];
  //bool _loading;

  // void initState() {
  //   super.initState();
  //  // _loading = true;
  //   Service.getjsondataclass().then((users) {
  //     _Users = users;
  //     setState(() {
  //
  //     });
  //   //  _loading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:5,left: 2,right: 2),
      child: FutureBuilder<Users>(
        future: data.fetchPosts(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<Data> list= snapshot.data.data;
            return ListView.builder(
              itemCount: list.length,
              itemBuilder: (context,index){
                Data user=list[index];
                return Container(
                 // color: Colors.black26,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.2,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:ListTile(
                  title: Text('${user.firstName}  ${user.lastName}',style: TextStyle(color: Colors.blue),),
                  subtitle: Text('${user.email}',style: TextStyle(color: Colors.black)),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                ));
              }
            );}
          else{
            return Center(child: CircularProgressIndicator());
          }
        }

      )
      // color: Colors.white,
      // child: (){
      //   if(_Users!=null&&_Users.isNotEmpty)
      //     return ListView.builder(
      //     itemCount: null == _Users ? 0 : _Users.length,
      //     itemBuilder: (context, index) {
      //       Users user = _Users[index];
      //       return ListTile(
      //         title: Text(user.),
      //         subtitle: Text('${user.phone}\n${user.email}'),
      //       );
      //     },
      //   );
      //   else
      //     return Container(
      //       child: Center(
      //         child: CircularProgressIndicator(),
      //        // child: Text("No item avaiable"),
      //       ),
       //   );
    // }(),
    );
  }
}
