import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/DataBaseDemo/DBHelper.dart';
import 'package:flutter_app/DataBaseDemo/User.dart';


class UserServices extends ChangeNotifier {
  List<User> searchUser = List();
  List<User> _searchList = List();

  List<User> get searchList => _searchList;

  set searchList(List<User> value) {
    _searchList = value;
    notifyListeners();
  }

  UserServices() {
    fetchUsers();
  }


  saveUser(String name, int age, String course) {
    log("save user");
    DBHelper.insert('users1', {
      'id': DateTime.now().toString(),
      'name': name,
      'age': age,
      'course': course
    });
    fetchUsers();
    notifyListeners();
  }

  fetchUsers() async {
    final usersList = await DBHelper.getData('users1');
    searchUser = usersList
        .map((item) =>
        User(
            id: item['id'],
            name: item['name'],
            age: item['age'],
            course: item['course'])
    )
        .toList();
    searchList = searchUser.toList();
    notifyListeners();
  }

  searchItemData() {
    return TextField(
        onChanged: (searchname) {
          print(" item fvffvv");
          searchList.clear();
          for (int i = 0; i < searchUser.length; i++) {
            print(searchname);
            if (searchUser[i]
                .name
                .toLowerCase()
                .contains(searchname.toLowerCase())) {
              searchList.add(searchUser[i]);
            }
            print(searchList);
            notifyListeners();
          }
        },
        decoration: InputDecoration(
            hintText: 'Search...',
            hintStyle:  TextStyle(color:Colors.lightBlue),
            labelText: 'Search',
            labelStyle: TextStyle(color:Colors.lightBlue),
            prefixIcon: Icon(Icons.search,color:Colors.lightBlue),
            enabledBorder: borderDesign(),
            focusedBorder: borderDesign(),
            errorBorder: borderDesign(),
            focusedErrorBorder: borderDesign(),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),

            ))
    );
  }
  borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide(color: Colors.lightBlue),
    );
  }
  void deleteUser(String id) {
    DBHelper.deleteData('users1', id);
    notifyListeners();
    fetchUsers();
  }

  updateUser(String id, String name, int age, String course) {
    DBHelper.updateData('users1', id, {
      'id': DateTime.now().toString(),
      'name': name,
      'age': age,
      'course': course
    });
    fetchUsers();
    notifyListeners();
  }
  _borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide(color: Colors.lightBlue),
    );
  }
  datapadding(Name,Controller){
    return Padding(
      padding:
      const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: TextField(
        controller: Controller,
        //keyboardType: TextInputType.number,
        decoration: InputDecoration(
            enabledBorder: _borderDesign(),
            focusedErrorBorder: _borderDesign(),
            errorBorder: _borderDesign(),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(50.0)),
              borderSide: BorderSide(color: Colors.lightBlue),
            ),
            labelText: Name,
            labelStyle: TextStyle(color:Colors.lightBlue),
            hintStyle: TextStyle(color: Colors.black),
        ),

      ),
    );
  }

}
