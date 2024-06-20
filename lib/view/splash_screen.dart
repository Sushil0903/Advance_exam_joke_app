import 'dart:async';

import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, "home_page");
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.red,
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Image.asset("images/splash.jpg",height: double.infinity,width: double.infinity,fit: BoxFit.cover),
              Transform.translate(offset: Offset(90,160),
              child: Text("'WELCOME'",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 25,letterSpacing: 12),)),
            ],
          ),),
    );
  }
}
