import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


void main() => runApp(cardData());

/// This Widget is the main application widget.
class cardData extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(title: Text('Flutter Card Example')),
        //  backgroundColor: Colors.yellow,
        body: CardWidget(),
      ),
    );
  }
}

int _current = 0;
List<String> images = [
  "https://media.istockphoto.com/photos/candy-skies-picture-id511675552?k=6&m=511675552&s=612x612&w=0&h=yOryDNUpEWly_McZgQwE_d57tqGVvUrzE_NLpvIPkCk=",
  "https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=6&m=517188688&s=612x612&w=0&h=jQKl_eDUwg4hCXjl4X5i6FPuTw-V-NfEOtLkvsrgC3Y=",
  "https://media.istockphoto.com/photos/moraine-lake-in-banff-national-park-canada-picture-id500177214?k=6&m=500177214&s=612x612&w=0&h=dS37wSvCnCb8Iai08w7nOkTWBf8i5YcZoosa15rgh4c=",
  "https://media.istockphoto.com/photos/creative-layout-green-leaves-with-white-square-frame-flat-lay-for-picture-id922764488?k=6&m=922764488&s=612x612&w=0&h=sjUDpEm5X-rJv7Fv3D5qWaI9w4IfGDOwLEfdXlxxa08="
];

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
            children: [
              Container(

                margin: EdgeInsets.only(top: 40),
                alignment: Alignment.topCenter,

               child: CarouselSlider(
                  height: 400.0,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },

                  items: images.map((imgurl) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.amber
                            ),
                            child: Image.network(
                              imgurl,
                              fit: BoxFit.fill,
                            )

                        );
                      },
                    );
                  }).toList(),
                ),),
              // width: 300,
              // height: 250,
              //  padding: new EdgeInsets.all(10.0),
              Column(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(top :40),
                      alignment: Alignment.center,
                      width: 300,
                      height: 225,
                      padding: new EdgeInsets.all(10.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.lightBlue,
                        elevation: 10,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                // leading: Icon(Icons.album, size: 60,color: Colors.white,),
                                leading: CircleAvatar(
                                  radius: 35,
                                  /* ConstrainedBox(
                                          constraints: BoxConstraints(
                                            minWidth: 50,
                                            minHeight: 50,
                                            maxWidth: 50,
                                            maxHeight: 50,
                                                    ),*/
                                  backgroundImage: AssetImage(
                                      'images/Ankit2.jpg'),
                                ),

                                //leading: Image.asset('images/Ankit2.jpg'),
                                title: Text(
                                  'ANKIT SHARMA',
                                  style: TextStyle(fontSize: 30.0, color: Colors
                                      .white),
                                ),
                                subtitle: Text(
                                    'FLUTTER TRAINEE',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white)
                                ),

                              ),
                              ButtonBar(
                                // child: Align(
                                children: <Widget>[
                                  RaisedButton(
                                    color: Colors.white,
                                    child: const Text('Add',style: TextStyle(color: Colors.lightBlue),),
                                    onPressed: () {
                                      /* ... */
                                    },
                                  ),
                                  RaisedButton(
                                    color: Colors.white,
                                    child: const Text('Remove',style: TextStyle(color: Colors.lightBlue)),
                                    onPressed: () {
                                      /* ... */
                                    },
                                  ),
                                ],
                              ),
                            ]),

                      ),
                    ),




                  ]),
            ])
    );
  }

//   void setState( Function() param0) {}
}

/// This is the stateless widget that the main application instantiates.
