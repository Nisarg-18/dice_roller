import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Dice Roller')),
      ),
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var one = AssetImage('images/one.png');
  var two = AssetImage('images/two.png');
  var three = AssetImage('images/three.png');
  var four = AssetImage('images/four.png');
  var five = AssetImage('images/five.png');
  var six = AssetImage('images/six.png');
  var defaultFace = AssetImage('images/one.png');
  var currentFace = AssetImage('images/one.png');
  var currentFace1 = AssetImage('images/two.png');
  var defaultFace1 = AssetImage('images/one.png');

  @override
  void initState() {
    super.initState();
    setState(() {
      defaultFace = one;
      defaultFace1 = six;
    });
  }

  void roller() {
    var rnd = (1 + Random().nextInt(6));

    switch (rnd) {
      case 1:
        currentFace = one;
        break;
      case 2:
        currentFace = two;
        break;
      case 3:
        currentFace = three;
        break;
      case 4:
        currentFace = four;
        break;
      case 5:
        currentFace = five;
        break;
      case 6:
        currentFace = six;
        break;
    }
    setState(() {
      defaultFace = currentFace;
    });
  }

  void roller1() {
    var rnd = (1 + Random().nextInt(6));

    switch (rnd) {
      case 1:
        currentFace1 = six;
        break;
      case 2:
        currentFace1 = five;
        break;
      case 3:
        currentFace1 = four;
        break;
      case 4:
        currentFace1 = three;
        break;
      case 5:
        currentFace1 = two;
        break;
      case 6:
        currentFace1 = one;
        break;
    }
    setState(() {
      defaultFace1 = currentFace1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                height: 150.0,
                width: 150.0,
                image: defaultFace,
              ),
              SizedBox(
                width: 30.0,
              ),
              Image(
                height: 150.0,
                width: 150.0,
                image: defaultFace1,
              ),
            ],
          ),
          Container(
            width: 200.0,
            child: ElevatedButton(
              onPressed: () {
                roller();
                roller1();
              },
              child: Text(
                'Roll the Dice',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                padding: EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
