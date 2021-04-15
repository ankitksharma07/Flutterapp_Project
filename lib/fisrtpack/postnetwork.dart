import 'dart:convert';
import 'package:flutter_app/fisrtpack/postclassdata.dart';
import 'package:http/http.dart' as http;

Future<Users> fetchPosts(String num) async{
  final response= await http.get("https://jsonplaceholder.typicode.com/users/${num}");
  if (response.statusCode==200){
    return Users.fromJson(json.decode(response.body));
  }else{
    return throw Exception('Failed to run');
  }
}
