import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
void main(){
  runApp(CarouralPro());
}
class CarouralPro extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Caroural_Pro slider"),
      ),
      body: CarouralProData(),
    );
  }
  
}
class CarouralProData extends StatefulWidget {
  @override
  _CarouralProDataState createState() => _CarouralProDataState();
}

class _CarouralProDataState extends State<CarouralProData> {
  @override
  Widget build(BuildContext context) {
    return Carousel(
      images: [
        NetworkImage( "https://media.istockphoto.com/photos/candy-skies-picture-id511675552?k=6&m=511675552&s=612x612&w=0&h=yOryDNUpEWly_McZgQwE_d57tqGVvUrzE_NLpvIPkCk=",),
        NetworkImage( "https://media.istockphoto.com/photos/moraine-lake-in-banff-national-park-canada-picture-id500177214?k=6&m=500177214&s=612x612&w=0&h=dS37wSvCnCb8Iai08w7nOkTWBf8i5YcZoosa15rgh4c=",),
        NetworkImage("https://media.istockphoto.com/photos/mountain-landscape-picture-id517188688?k=6&m=517188688&s=612x612&w=0&h=jQKl_eDUwg4hCXjl4X5i6FPuTw-V-NfEOtLkvsrgC3Y=",),
        NetworkImage("https://media.istockphoto.com/photos/creative-layout-green-leaves-with-white-square-frame-flat-lay-for-picture-id922764488?k=6&m=922764488&s=612x612&w=0&h=sjUDpEm5X-rJv7Fv3D5qWaI9w4IfGDOwLEfdXlxxa08="),
        //ExactAssetImage("assets/images/LaunchImage.jpg")
      ],
      autoplay: false,
      overlayShadow: true,
      showIndicator: true,
      dotColor: Colors.lightBlue,
      // dotBgColor: Colors.purple.withOpacity(0.5),
      //  dotBgColor: Colors.red,
    );
  }
}
