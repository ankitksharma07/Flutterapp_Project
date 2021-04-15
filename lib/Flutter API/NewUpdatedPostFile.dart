import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/Flutter API/DeleteViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(PassData());
}

class PassData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PassDataItem(),
    );
  }
}

class PassDataItem extends StatefulWidget {
  @override
  _PassDataItemState createState() => _PassDataItemState();
}

class _PassDataItemState extends State<PassDataItem> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: addAuthor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            child: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
              Navigator.pop(context);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     // fullscreenDialog: true,
            //     builder: (context) {
            //       //  print( count++);
            //       return ItemData();
            //     },
            //   ),
            // );
          },
        )),
        title: Text('New Data'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Method(),
          ],
        ),
      ),
    );
  }
}

 Widget Method() {
 return Expanded(
    child: Consumer<ItemAdd>(
      builder: (context, itemAdd, _) {
        return ListView.builder(
          itemCount: itemAdd.PassItem.length,
          itemBuilder: (context, index) {
            return Card(

              //padding: EdgeInsets.all(15.0),
              child: ListTile(
                title: Text(
                  "Name:- ${itemAdd.PassItem[index]}",
                  style: TextStyle(
                      color: Color.fromARGB(250, 100, 150, 220),
                      fontSize: 22),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}
