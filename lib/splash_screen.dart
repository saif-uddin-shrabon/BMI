import 'dart:async';

import 'package:bmi/main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyHomePage(title: 'BMI Calculator',)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffF6F6E9),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //image here
                       Image.asset('assets/icons/splash.png',height: 200,width: 200,),
                    Text('Calculator'
                      ,style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff457D58),
                     ),

                    ),





              ],
            ),
            ),
          ),
      ),
    );
  }
}

