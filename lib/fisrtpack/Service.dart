import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/fisrtpack/jsondataclass.dart';

class Service {
  Future<Users> fetchPosts() async{
    final String url =("https://reqres.in/api/users");
    final response= await http.get(url);
    if (response.statusCode==200){
      return Users.fromJson(json.decode(response.body));
    }else{
      return throw Exception('Failed to run');
    }
  }


}

