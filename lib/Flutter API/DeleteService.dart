import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/ClassDatabse/DeleteNewClass.dart';

class Service {
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

  Future<Task> deleteAlbumdata(String id) async {
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
