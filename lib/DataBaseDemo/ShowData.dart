import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_app/DataBaseDemo/UserServices.dart';
import 'package:provider/provider.dart';

class ShowDataDataBase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserServices>(
      create: (BuildContext context) {
        return UserServices();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ShowData(),
      ),
    );
  }
}

class ShowData extends StatefulWidget {
  @override
  _ShowDataState createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<UserServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('SQFLite Demo'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //   fullscreenDialog: true,
                  builder: (context) {
                    return DatabaseFrom();
                  },
                ),
              );
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            viewmodel.datapadding('Name',  _nameController),
            viewmodel.datapadding('Age',  _ageController),
            viewmodel.datapadding('Course' ,  _courseController),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Container(
                height: 40,
                width: 250,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text("Save",style: TextStyle(color: Colors.white)),
                  color: Colors.lightBlue,
                  onPressed: () async {
                    await viewmodel.saveUser(_nameController.text,
                        int.parse(_ageController.text), _courseController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DatabaseFrom()));
                    _nameController.clear();
                    _ageController.clear();
                    _courseController.clear();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DatabaseFrom extends StatefulWidget {
  @override
  _DatabaseFromState createState() => _DatabaseFromState();
}

class _DatabaseFromState extends State<DatabaseFrom> {
  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<UserServices>(context);
    log("Build ${viewmodel.searchList.length}");
    return Scaffold(
        appBar: AppBar(
          title: Text("DataBase ListView"),
        ),
        body: Container(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: viewmodel.searchItemData(),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: viewmodel.searchList.length,
                  itemBuilder: (ctx, idx) {
                    return Card(
                        elevation: 3,
                        child: ListTile(
                          title: Text(
                              '${viewmodel.searchList[idx].name} \n${viewmodel.searchList[idx].age}',
                            style: TextStyle(color:Colors.lightBlue),),
                          subtitle: Text('${viewmodel.searchList[idx].course}', style: TextStyle(color:Colors.lightBlue)),
                          trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.delete,color:Colors.lightBlue),
                                  onPressed: () {
                                    viewmodel.deleteUser(
                                        viewmodel.searchList[idx].id);
                                    //viewmodel.searchList.removeAt(idx);
                                    // setState(() {});
                                  },
                                ),
                                IconButton(
                                    icon: Icon(Icons.edit,color: Colors.lightBlue,),
                                    onPressed: () async {
                                      await showBottomModal(
                                        context,
                                        viewmodel.searchList[idx].id,
                                        viewmodel.searchList[idx].name,
                                        viewmodel.searchList[idx].age,
                                        viewmodel.searchList[idx].course,
                                      );
                                    }),
                              ]),
                        ));
                  }))
        ])));
  }

  showBottomModal(
      BuildContext ctx, String id, String name, int age, String course) {
    final TextEditingController _updateNameController = TextEditingController();
    final TextEditingController _updateAgeController = TextEditingController();
    final TextEditingController _updatecourseController =
        TextEditingController();

    _updateNameController.text = name;
    _updateAgeController.text = age.toString();
    _updatecourseController.text = course;

    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          var viewmodel = Provider.of<UserServices>(context);
          return Container(
              height: 700,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    viewmodel.datapadding('Name', _updateNameController),
                    viewmodel.datapadding('Age', _updateAgeController),
                    viewmodel.datapadding('Course', _updatecourseController),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: RaisedButton(
                        color: Colors.lightBlue,
                        child: Text("Update",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                        onPressed: () async {
                          // services.searchList;
                          await viewmodel.updateUser(
                              id,
                              _updateNameController.text,
                              int.parse(
                                _updateAgeController.text,
                              ),
                              _updatecourseController.text);
                          Navigator.of(ctx).pop();
                        },
                      ),
                    ),
                  ],
                ),
              ));
        });
  }
}
