
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/fisrtpack/Formpage.dart';
import 'package:multilevel_drawer/multilevel_drawer.dart';

 class DataStore extends StatelessWidget{

  @override
  borderDesign() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      borderSide: BorderSide(color: Colors.lightBlue),
    );
  }
   textFormField1(labelText, hintText, controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: borderDesign(),
        focusedBorder: borderDesign(),
        errorBorder: borderDesign(),
        focusedErrorBorder: borderDesign(),
        labelText: '$labelText',
        hintText: '$hintText',
      ),
    );
  }

  Widget sizebox() {
    return SizedBox(
      height: 20.0,
    );
  }
  Shape() {
    RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18),
    );
  }

  Imagedata(url, width, height) {
    return Container(
        child: Image.network(
            url,
            fit: BoxFit.fill,
            width: width,
            height: height)
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}
