import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){Navigator.of(context).pushReplacementNamed('/home');});
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 200,
          decoration: BoxDecoration(
            // color: Colors.red,
            image: DecorationImage(
              fit: BoxFit.cover,
                image: AssetImage('assets/image/logo.png'))

          ),
        ),
      ),
    );
  }
}
