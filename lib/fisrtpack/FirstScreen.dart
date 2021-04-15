import 'package:flutter/material.dart';

class stack extends StatefulWidget {
  @override
  _stackState createState() => _stackState();
}

class _stackState extends State<stack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          " Stack Page"
        ),
      ),
      body: Container(
        child: Stack(children: <Widget>[
          Stack(
             fit: StackFit.loose,
            // fit: StackFit.expand,
           //  fit: StackFit.passthrough,
              children: <Widget>[
              Container(
                height: 200,
                width:300,
                padding: EdgeInsets.only(top:100,left: 70),
                margin: EdgeInsets.only(top:100,left:58),
                color:Colors.black45,

                child:Text(

                  "Non_Positioned field" ,
                  style: TextStyle(color:Colors.red),
                ),
              ),
               Align(

              alignment: Alignment.center,
              child: Container(
                height: 200,
                color: Colors.blue,

               // child: Align(
                 //  alignment: Alignment.bottomCenter,

                    child:Align(

                      alignment: Alignment.bottomCenter,
                      child: Container(
                        // alignment: Alignment.bottomCenter,
                        width: 150,
                        height: 100,
                        color: Colors.black,

                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            " Ankit",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    )),
              ),

          ]),

            Positioned(
              top: 500,
             left: 120,

             child:Container(
               padding: EdgeInsets.only(top: 50),
               height: 120,
               width: 180,
               color: Colors.red,
               child: Text(
                 "Positioned Stack ",
                 style:TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w700),
               ),

              )
            ),

                // Positioned(
                //   top: 20,
                //   left: 150,
                //   child: RaisedButton(
                //      color: Colors.red,
                //      child:Text(
                //        "Stack Screen",
                //        style: TextStyle(color:Colors.white),
                //      ),
                //      shape: RoundedRectangleBorder(
                //        borderRadius: new BorderRadius.circular(18.0),
                //      ),
                //      onPressed: (){
                //        gotostack(context);
                //      },),),
        ]),
      ),
    );
  }
}
// Future gotostack(context){
//   Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
//
// }
