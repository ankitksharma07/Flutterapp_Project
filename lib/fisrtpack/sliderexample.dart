import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/fisrtpack/CarouralPro.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

//import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:slider_button/slider_button.dart';
import 'package:flutter_switch/flutter_switch.dart';

void main() {
  runApp(Sliderdata());
}

class Sliderdata extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Muiltiple Slider"),
      ),
      body: Newlider(),
    );
  }
}

class Newlider extends StatefulWidget {
  @override
  _NewliderState createState() => _NewliderState();
}

class _NewliderState extends State<Newlider> {
  double _currentSliderValue = 1;
  double _currentSliderValue1 = 1;
  bool status = false;

//  SfRangeValues _values = SfRangeValues(40.0, 80.0);
  // double _value = 50.0;
  SfRangeValues _value = SfRangeValues(40.0, 80.0);

  void confirmed() {
    print('confirmed slider');
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
            child: Column(children: [
          Stack(children: [
            Container(
              color: Color.fromARGB(100, 20, 130, 200),
              height: 710,
              width: 430,
              child: Column(
                children: [
                  Container(
                    //lignment:Alignment.,
                    color: Color.fromARGB(200, 220, 130, 100),
                    height: 100,
                    width: 430,
                    child: Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    ),
                  ),
                  Slider(
                    value: _currentSliderValue1,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    label: _currentSliderValue1.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue1 = value;
                      });
                    },
                  ),
                  ConfirmationSlider(
                    onConfirmation: () => confirmed(),
                  ),
                ],
              ),
            ),
            Positioned(
                bottom: 78,
                left: 120,
                child: Container(
                    height: 50,
                    width: 170,
                    child: RaisedButton(
                      color: Colors.blueAccent,
                      child: Text(
                        'Carousal_Pro',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 18),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      onPressed: () {
                        newpage(context);
                      },
                    ))),
            Positioned(
              bottom: 99,
              left: 125,
              child: SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customWidths: CustomSliderWidths(progressBarWidth: 10),
                  spinnerMode: false,
                ),
                min: 5,
                max: 100,
                initialValue: 30,
              ),
            ),
            Positioned(
              bottom: 270,
              //left: 50,3
              child: Container(
                height: 50,
                width: 420,
                child: SfRangeSlider(
                  min: 0.0,
                  max: 100.0,
                  values: _value,
                  interval: 20,
                  showTicks: true,
                  showLabels: true,
                  enableTooltip: true,
                  minorTicksPerInterval: 1,
                  onChanged: (SfRangeValues values) {
                    setState(() {
                      _value = values;
                    });
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 430,
              left: 50,
              child: Container(
                  height: 65,
                  width: 300,
                  child: SliderButton(
                    action: () {
                      ///Do something here OnSlide
                    },

                    ///Put label over here
                    label: Text(
                      "Slide to cancel !",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 17),
                    ),
                    icon: Center(
                        child: Icon(
                      Icons.clear,
                      color: Colors.white,
                      size: 40.0,
                      // semanticLabel: 'Text to announce in accessibility modes',
                    )),

                    ///Change All the color and size from here.
                    width: 230,
                    radius: 40,
                    buttonColor: Colors.blueAccent[400],
                    backgroundColor: Colors.white,
                    // highlightedColor: Colors.red,
                    // baseColor: Colors.white,
                  )),
            ),
            Positioned(
              bottom: 322,
              //left: 50,
              child: Container(
                height: 50,
                width: 420,
                child: FlutterSwitch(
                  width: 125.0,
                  height: 55.0,
                  valueFontSize: 25.0,
                  toggleSize: 40.0,
                  value: status,
                  borderRadius: 30.0,
                  padding: 8.0,
                  activeToggleColor: Colors.white,
                  inactiveTextColor: Colors.black,
                  activeTextColor: Colors.white,
                  showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                      // print(status);
                    });
                    print(status);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 375,
              left: 150,
              child: Container(
                height: 50,
                width: 130,
                child: LiteRollingSwitch(
                  //initial value
                  value: true,
                  textOn: 'Yes',
                  textOff: 'No',
                  colorOn: Colors.lightBlueAccent,
                  colorOff: Colors.redAccent[700],
                  iconOn: Icons.done,
                  iconOff: Icons.remove_circle_outline,
                  textSize: 16.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Current State of SWITCH IS: $state');
                  },
                ),
              ),
            ),
          ]),
          BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text('Home'),
                    backgroundColor: Colors.green),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    title: Text('Search'),
                    backgroundColor: Colors.yellow),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  backgroundColor: Colors.blue,
                ),
              ],
              type: BottomNavigationBarType.shifting,
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black,
              iconSize: 40,
              onTap: _onItemTapped,
              elevation: 5)
        ])));
  }
}

Future newpage(context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => CarouralPro()));
}
