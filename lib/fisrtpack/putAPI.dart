import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/albums/4');

  if (response.statusCode == 200) {
    // If the server d0id return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

Future<Album> updateAlbum(String title) async {
  final http.Response response = await http.put(
    'https://jsonplaceholder.typicode.com/albums/1',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    log("updateAlbum ${response.body}");
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to update album.');
  }
}

class Album {
  final int id;
  final String title;

  Album({this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() {
  runApp(PutData());
}

class PutData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Put API "),
      ),
      body: Newputdata(),
    );
  }
}

class Newputdata extends StatefulWidget {
  @override
  _NewputdataState createState() => _NewputdataState();
}

class _NewputdataState extends State<Newputdata> {
  @override

    final TextEditingController _controller = TextEditingController();
    Future<Album> _futureAlbum = fetchAlbum();

    // @override
    // void initState() {
    //   super.initState();
    //   _futureAlbum = fetchAlbum();
    // }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
            alignment: Alignment.center,
           padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<Album>(
              future: _futureAlbum,
              builder: (context, snapshot) {
              //  if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(snapshot.data.title),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(hintText: 'Enter Title'),
                        ),
                        ElevatedButton(
                          child: Text('Update Data'),
                          onPressed: () {
                            setState(() {
                              _futureAlbum = updateAlbum(_controller.text);
                            });
                          },
                        ),
                      ],
                    );
                  } else   {
                    return CircularProgressIndicator();
                    return Text("${snapshot.error}");
                  }
              //  }

                //return CircularProgressIndicator();
              },
            )),
      );
    }
  }

