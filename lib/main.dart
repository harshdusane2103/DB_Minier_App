import 'package:db_minier_app/View/Category/databaseCategory.dart';
import 'package:db_minier_app/View/Category/simpleCategory.dart';
import 'package:db_minier_app/View/Detail/detail.dart';
import 'package:db_minier_app/View/Home/home.dart';
import 'package:db_minier_app/View/Like/like.dart';
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
       // initialRoute: '/home',
       getPages: [
         GetPage(name: '/', page: () => SplashScreen(),transition: Transition.rightToLeft),
         GetPage(name: '/home', page: () => HomeScreen(),transition:Transition.rightToLeft),
         GetPage(name: '/Detail', page: () => DetailScreen(),transition:Transition.rightToLeft),
         GetPage(name: '/simple', page: () => SimplecategoryScreen(),transition:Transition.rightToLeft),
         // GetPage(name: '/base', page: () => DatabasecategoryScreen(),transition:Transition.rightToLeft),
         GetPage(name: '/like', page: () => LikedScreen(),transition:Transition.rightToLeft),
       ],
    );
  }
}

