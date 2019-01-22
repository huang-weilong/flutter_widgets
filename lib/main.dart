import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int text = 5;
  Timer timer1, timer2;

  @override
  void initState() {
    super.initState();
    timer1 = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        text--;
        if (text == 0) timer.cancel();
      });
    });
    timer2 = Timer.periodic(Duration(seconds: 5), (timer) {
      timer2.cancel();
      go2HomePage();
    });
  }

  void go2HomePage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  void dispose() {
    timer1.cancel();
    timer2.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Image.asset('assets/images/welcome.jpg'),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: GestureDetector(
              onTap: () {
                timer1.cancel();
                timer2.cancel();
                go2HomePage();
              },
              child: Container(
                alignment: Alignment.center,
                width: 60.0,
                height: 30.0,
                decoration: BoxDecoration(
                  color: Color(0x44000000),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  '跳过' + text.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
