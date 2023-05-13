import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, 'Home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF0C1638),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:  const EdgeInsets.only(top: 115),
                child: Image.asset("assets/images/bmi.png"),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:  EdgeInsets.only(bottom: 160),
                child: CircularProgressIndicator(color: Colors.pink,),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:  EdgeInsets.only(bottom: 121),
                  child: Text("Check your BMI",style: TextStyle(color: Colors.white,fontSize: 21),)
              ),
            ),

          ],
        ),
      ),
    );
  }
}