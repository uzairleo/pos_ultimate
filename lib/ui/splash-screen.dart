import 'package:flutter/material.dart';
import 'package:pos/ui/home/app-view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => AppView()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF2b80eb),
      body: Center(
          child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/pos.png"))),
      )),
    );
  }
}
