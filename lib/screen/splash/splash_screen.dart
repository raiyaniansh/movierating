import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), () { 
      Navigator.pushReplacementNamed(context, 'home');
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey.shade900,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 300,),
              Image.asset('assets/images/logopng.png',height: 150,),
              Expanded(child: SizedBox()),
              Text("JustWatch",
                style: GoogleFonts.dancingScript(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1),
              ),
              SizedBox(height: 15,),
              CircularProgressIndicator(color: Colors.white,),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
