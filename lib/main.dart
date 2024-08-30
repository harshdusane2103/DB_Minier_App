import 'package:db_minier_app/View/Detail/detail.dart';
import 'package:db_minier_app/View/Home/home.dart';
import 'package:db_minier_app/View/Splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       getPages: [
         GetPage(name: '/', page: () => SplashScreen(),transition: Transition.rightToLeft),
         GetPage(name: '/home', page: () => HomeScreen(),transition:Transition.rightToLeft),
         GetPage(name: '/Detail', page: () => DetailScreen(),transition:Transition.rightToLeft),
       ],
    );
  }
}

