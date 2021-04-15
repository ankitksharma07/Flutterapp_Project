import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_app/Flutter API/NewUpdatedPostFile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/fisrtpack/Formpage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/fisrtpack/Provider1Example.dart';
import 'DeleteViewModel.dart';
import 'package:flutter_app/fisrtpack/Provider1Example.dart';


class API {
   Future<Album> createTask(Album task) async {
  final Response response = await post('https://jsonplaceholder.typicode.com/albums',
  headers: <String, String>{
  'Content-Type': 'application/json;charset=UTF-8'
  },
  body: jsonEncode(task.toJson()));

  if (response.statusCode == 200) {
  log(response.body);
  return Album.fromJson(json.decode(response.body));
  } else {
  //print('Error');
  throw Exception("Failed");
  }
  }

  // Future<List<Album>> fetchPosts() async {
  //   final String url = ("https://gorest.co.in/public-api/users");
  //   final response = await http.get(url);
  //   if (response.statusCode == 200) {
  //     print(response.body);
  //     final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
  //     return parsed.map<Album>((item) => Album.fromJson(item)).toList();
  //   } else {
  //     return throw Exception('Failed to run');
  //   }
  // }
  // static Future<Album> createAuthor(Album Task) async {
  //   //business logic to send data to server
  //   final Response response = await post('https://jsonplaceholder.typicode.com/albums/Task',
  //       headers: <String, String>{
  //         'Content-Type': 'application/json;charset=UTF-8'
  //       },
  //       body: jsonEncode(Task.toJson()));
  //
  //   if (response.statusCode == 200) {
  //     //print(response.body);
  //     return Album.fromJson(json.decode(response.body));
  //   } else {
  //     //print('Error');
  //     throw Exception("Failed");
  //   }
  // }

  static Future<List<Album>> datafatch() async {
    log("message: datafatch ");

    final Response response = await get('https://jsonplaceholder.typicode.com/albums');

    if (response.statusCode == 200) {

      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      print(response.body);
      return parsed.map<Album>((item) => Album.fromJson(item)).toList();

    } else {
      //print('Error');
      throw Exception("Failed");
    }
  }

  static Future<Album> deleteData(int id) async {
    //business logic to send data to server
    final  response = await delete(
        'https://jsonplaceholder.typicode.com/albums/$id',
        // headers: <String, String>{
        //   'Content-Type': 'application/json;charset=UTF-8'
        // }
        );

    if (response.statusCode == 200) {
      log(response.body);
      return Album.fromJson(json.decode(response.body));
    } else {
      //print('Error');
      throw Exception("Failed");
    }
  }
}

class Album {
  int userId;
  int id;
  String title;

  Album({this.userId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

void main() {
  runApp(DeleteApiPage());
}
class DeleteApiPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: deleteContentapi(),
   );
  }

}

// class DeleteApiPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => DataItem(),
//       child: deleteContentapi(),
//     );
//   }
// }

class deleteContentapi extends StatefulWidget {

  @override
  State createState() {
    return _deleteapiState();
  }
}

class _deleteapiState extends State<deleteContentapi> {
  List<Album> _futureAlbum;
  var listview;
  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    _futureAlbum = await API.datafatch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Delete Data Example'),
        ),
        body: Container(
              child: () {
              if (_futureAlbum != null && _futureAlbum.isNotEmpty)
                return ListView.builder(
                    itemCount: _futureAlbum.length,
                    itemBuilder: (context, i) {
                      return Dismissible(
                        key: ObjectKey(_futureAlbum[i].id),
                        onDismissed: (direction) {
                          print(direction.index);
                          API.deleteData(_futureAlbum[i].id).then((value) => value);
                          _futureAlbum.removeAt(i);
                          setState(() {});
                        },
                        child: Card(
                          child: ListTile(
                            title: Text(_futureAlbum[i].title.toString()),
                            subtitle: Row(
                              children: <Widget>[
                                Text('${_futureAlbum[i].id}' ),
                                SizedBox(
                                  width: 50,
                                ),
                            //    Text('\n${_futureAlbum[i].userId}'),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              else
                return Container(
                  child: Center(
                    child: Text("Fetaching datad"),
                  ),
                );
            }(),


            ),
        floatingActionButton:FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () async {
                await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeApp(),
                          ),
                        );
                  }

            ),
    );
  }
}

