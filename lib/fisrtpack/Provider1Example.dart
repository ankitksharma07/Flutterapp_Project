import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_app/Flutter API/DeleteViewModel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Flutter API/NewUpdatedPostFile.dart ';
import 'package:flutter_app/ClassDatabse/MethodStore.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //  return MultiProvider(
    //    providers: [
    return ChangeNotifierProvider<ItemAdd>(
      create: (BuildContext context) {
        return ItemAdd();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ItemData(),
      ),
    );
    //   ChangeNotifierProvider<ItemAdd>(
    //     create: (BuildContext context) {
    //       return ItemAdd();
    //     },
    //   ),
    //   ChangeNotifierProvider<ItemAdd>(
    //     create: (BuildContext context) {
    //       return ItemAdd();
    //     },
    //   )
    // ],
    // child: MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: ItemData(),
    // ),
    //);
  }
}

class ItemData extends StatefulWidget {
  @override
  _ItemDataState createState() => _ItemDataState();
}

class _ItemDataState extends State<ItemData> {
  int count = 0;
  int count1 = 0;
  bool flag =false;
  // @override
  // initState() {
  //   super.initState();
  //   setState(() {
  //     Consumer1 ();
  //   });
  // }

  @override
  Widget build(BuildContext context) {

   // var viewmodel = Provider.of<ItemAdd>(context);

    log(' Mainbuild Method---------------------------${count++}----------------------------------');
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Provider 1 Demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.create),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //   fullscreenDialog: true,
                  builder: (context) {
                    //  print( count++);
                    return Provider1();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[

            UpdateCompany(),
            Expanded(
              child: Consumer<ItemAdd>(
                builder: (context, itemAdd, _) {
                  return ListView.builder(
                    itemCount: itemAdd.itemList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        //padding: EdgeInsets.all(15.0),
                        child: ListTile(
                          title: Text(
                            "Name:- ${itemAdd.itemList[index].item.toUpperCase()}",
                            style: TextStyle(
                                color: Color.fromARGB(250, 100, 150, 220),
                                fontSize: 22),
                          ),
                          // subtitle: Text('Age:-     ${itemAddNotifier.itemList[index].item1}',style: TextStyle( color:Color.fromARGB(250,100,150,220),fontSize: 22)),
                          trailing: IconButton(
                            icon: Icon(Icons.contact_page_outlined),
                            onPressed: () {
                              setState(() {
                                Provider.of<ItemAdd>(context, listen: false)
                                    .PassItemData(
                                  ('${itemAdd.itemList[index].item.toUpperCase()}'),
                                  ('${itemAdd.itemList[index].item1.toUpperCase()}'),
                                  ('${itemAdd.itemList[index].item2.toUpperCase()}'),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return PassData();
                                    },
                                  ),
                                );
                              });
                            },
                          ),
                          // onTap: (){
                          //   Provider.of<Passdata>(context, listen: false)
                          //       .PassItemData(
                          //       (' ${itemAddNotifier.itemList[index].item.toUpperCase()}'),('${itemAddNotifier.itemList[index].item1.toUpperCase()}'));
                          // },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  
  Widget UpdateCompany() {


    return Column(children: [

      Consumer<ItemAdd>(
        builder: (context, CompanyName, _) {
         // var viewmodel = Provider.of<ItemAdd>(context);
          log("Consumer");
          return Card(
              color: Color.fromARGB(250, 100, 150, 220),
              // margin: EdgeInsets.only(right: 40),
              child: ListTile(
                  title: Text(
                "${CompanyName.company.toUpperCase()}  ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              )));

          // return Text('${shopNameNotifier.company}',style: TextStyle(color: Colors.lightBlue,fontSize: 25,backgroundColor: Color.fromRGBO(230, 45, 56, 100)),);
        },
      ),
    ]);
  }

}

class Provider1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AddItem(),
    );
  }
}

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  DataStore data = new DataStore();

  int call = 0;

  pressmthod() async {
    if (Name.text.isEmpty || Age.text.isEmpty || College.text.isEmpty) {
      return null;
    } else{
      await Provider.of<ItemAdd>(context, listen: false)
          .addItem(Name.text, Age.text, College.text);
    Navigator.pop(context);
  }
  }

  final TextEditingController Name = TextEditingController();
  final TextEditingController Age = TextEditingController();
  final TextEditingController College = TextEditingController();
  final TextEditingController Company = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      // key: addAuthor,
      appBar: AppBar(
        title: Text('New Data'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              children: <Widget>[
                data.textFormField1('Name', ' Name', Name),
                data.sizebox(),
                data.textFormField1('Age', 'age', Age),
                data.sizebox(),
                data.textFormField1('College', 'College', College),
                data.sizebox(),
                RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18),
                    ),
                    child:
                        Text('ADD ITEM', style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      pressmthod();
                    }),
                data.sizebox(),
                data.textFormField1('CompanyName', 'Company', Company),
                data.sizebox(),
                RaisedButton(
                  color: Colors.lightBlue,
                  child: Text(
                    'UPDATE COMPANY',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                  onPressed: () async {
                      if (Company.text.isEmpty) {
                        return null;
                      } else {

                        await Provider.of<ItemAdd>(context, listen: false)
                            .updateitem(Company.text);
                        Navigator.pop(context);
                       // log('Update---------------------------${call++}----------------------------------');
                      };
                    //  print('----------${count1++}-------');
                    //   if (Company.text.isEmpty) {
                    //     return null;
                    //   } else
                    //     await Provider.of<ItemAdd>(context, listen: false)
                    //         .updateitem(Company.text);
                    //   Navigator.pop(context);
                    // print('----------${count1++}-------');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

