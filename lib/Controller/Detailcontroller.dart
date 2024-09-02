import 'package:db_minier_app/Utils/golabal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class DetailController extends GetxController
{
  List Contanertlist = [
    {
      'img': 'assets/images/goal.webp',
      'Qname': 'Goal Quotes',
    },
    {
      'img': 'assets/images/insp.webp',
      'Qname': 'Inspring Quotes',
    },
    {
      'img': 'assets/images/good.webp',
      'Qname': 'Good Quotes',
    },
    {
      'img': 'assets/images/happy.webp',
      'Qname': 'Happiness Quotes',
    },
    {
      'img': 'assets/images/pos.webp',
      'Qname': 'positive Quotes',
    },
    {
      'img': 'assets/images/sad.webp',
      'Qname': 'sad Quotes',
    },
    {
      'img': 'assets/images/strong.webp',
      'Qname': 'Strong Quotes',
    },
    {
      'img': 'assets/images/confidence.webp',
      'Qname': 'Confidence Quotes',
    },
  ];

  List<Color> colorList = [

    Colors.blue,
    Colors.grey,
    Colors.amber,
    Colors.white,
    Colors.teal,
    Colors.orange,
    Colors.green,
    Colors.deepPurple,
    Colors.black,
    Colors.brown,
    Colors.cyan,
    Colors.pink,
    Colors.red,
  ];
  Color selectColor = Colors.amber;

  List<GlobalKey> imgKey = List.generate(controller.QuoteList.length, (index) => GlobalKey());
  var selectedThemeimage = 'assets/image/quote1.webp';

  var selectedFontFamily = 'Dancing';

  List fontFamily = [
    'Cabin',
    'Gwendolyn',
    'Oswald',
    'Roboto',
    'Dancing',
  ];




  List BgimgList=[
    'assets/images/th1.webp',
    'assets/images/th2.webp',
    'assets/images/th3.jpg',
    'assets/images/th4.webp',
    'assets/images/th5.webp',
    'assets/images/th6.webp',
    'assets/images/th7.webp',
    'assets/images/th8.webp',
    'assets/images/th9.webp',
    'assets/images/th10.webp',
    'assets/images/th11.webp',
    'assets/images/th12.webp',
    'assets/images/th13.webp',
    'assets/images/th14.webp',
  ];



}