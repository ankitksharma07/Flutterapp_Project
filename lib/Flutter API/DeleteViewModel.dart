import 'dart:developer';
import 'dart:math';

import 'package:flutter/cupertino.dart';

class ItemAdd extends ChangeNotifier {


  List<Item> itemList = [];
  List<String> PassItem = [];
  String company = '';

  addItem(String itemName, String itemage, String itemCollege) async {
    Item item = Item(itemName, itemage, itemCollege);
    itemList.add(item);

    notifyListeners();
  }

  updateitem(String company) {
    this.company = company;
    notifyListeners();
  }



  PassItemData(String Name, String Age, String College) {
    if (PassItem.isEmpty) {
      return PassItem.add('${Name}\n Age:- ${Age}\n College:- ${College}');
    } else if (PassItem.isNotEmpty) {
      return {
        {PassItem.clear()},
        {PassItem.add('$Name\n Age:- $Age\n College:-$College')}
      };

    }
    notifyListeners();
  }
}

// class UpdateName extends ChangeNotifier {
// String company=' Tech Compose';
//   updateitem(String company) {
//     this.company = company;
//     notifyListeners();
//   }
// }

class Item {
  String item;
  String item1;
  String item2;
  String company;

  Item(this.item, this.item1, this.item2);

  Item.data(this.company);
}

// class Item1 {
//   String company;
//
//   Item1(this.company);
// }

// class Passdata extends ChangeNotifier{
//   List<String> PassItem=[];
//  //List<String> get Itemdata=>PassItem;
//   PassItemData (String Name,String Age,String College){
//     if(PassItem.isEmpty ){
//       return PassItem.add('${Name}\n Age:- ${Age}\n College:- ${College}');
//     }else if(PassItem.isNotEmpty){
//       return {{PassItem.clear() }  , {PassItem.add('$Name\n Age:- $Age\n College:-$College')}};
//       // return  PassItem.add(('${Name}\n Age:- ${Age}'));
//     }
//     notifyListeners();
//     }
//    // notifyListeners();
//
// }
