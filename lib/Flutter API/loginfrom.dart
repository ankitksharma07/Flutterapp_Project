import 'package:flutter/material.dart';
import 'package:flutter_app/ClassDatabse/DeleteNewClass.dart';
import 'package:flutter_app/Flutter API/DeleteService.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

void main() {
  runApp(NewTask());
}

class NewTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView Delete Api",
        ),
      ),
      body: NewDeleteTask(),
    );
  }
}

class NewDeleteTask extends StatefulWidget {
  @override
  _NewDeleteTaskState createState() => _NewDeleteTaskState();
}

Future<Task> fetchPosts() async {
  final String url = ("https://gorest.co.in/public-api/users");
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print(response.body);
    return Task.fromJson(json.decode(response.body));
  } else {
    return throw Exception('Failed to run');
  }
}
class ServiceDemo {
  Future<Task> deleteAlbum(String id) async {
    final http.Response response = await http.delete(
      'https://gorest.co.in/public-api/users/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print(response.body);
      return Task.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete album.');
    }
  }
}
class _NewDeleteTaskState extends State<NewDeleteTask> {
  Future<Task> newdata;
  ServiceDemo new1=new ServiceDemo();



  @override
  void initState() {
    super.initState();
   newdata = fetchPosts();
  }

  //Service service = new Service();

  @override
  Widget build(BuildContext context) {
    return Container(
            margin: EdgeInsets.only(top: 5, left: 2, right: 2),
            child: FutureBuilder<Task>(
                future: newdata,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data> list = snapshot.data.data;
                    return ListView.builder(
                        itemCount: list.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Data user = list[index];
                          return Dismissible(
                            // key:Key(list[index].id.toString()),
                            key: UniqueKey(),
                            direction: DismissDirection.startToEnd,
                            child: ListTile(
                              title: Text(
                                '${user.id}:  ${user.name}',
                                style: TextStyle(color: Colors.blue),
                              ),
                              subtitle: Text('MailId:- ${list[index].email}',
                                  style: TextStyle(color: Colors.black)),
                              trailing: IconButton(
                                  icon: Icon(Icons.delete_forever),
                                  onPressed: () {
                                    new1.deleteAlbum(snapshot.data.data[index].id.toString()).then((value) => value);
                                    list.removeAt(index);
                                    setState(() {

                                    });

                                  }),
                            ),
                            onDismissed: (DismissDirection direction) {
                              new1.deleteAlbum(snapshot.data.data[index].id.toString()).then((value) => value);
                              list.removeAt(index);
                              setState(() {

                              });
                              },
                          );
                        });
                  } else {
                    return Center(child:Container(child: CircularProgressIndicator()));
                  }
                })
    );
  }
}
