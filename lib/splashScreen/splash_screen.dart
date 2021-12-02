import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fooderlich/authentication/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds: 8), () async {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const AuthScreen()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset('images/splash.jpg'),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(18.0),
            child: Text(
              'Sell Food Online',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 40,
                fontFamily: 'Signatra',
                letterSpacing: 3,
              ),
            ),
          )
        ],
      ),
    );
  }
}
