
import 'package:db_minier_app/Controller/Controller.dart';

import 'package:flutter/material.dart';


// class Approutes
// {
//   static Map<String,Widget Function(BuildContext)>routes=
//   {
//     '/':(context)=>homeScreen(),
//   };
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var selectedThemeimage = 'assets/images/th11.webp';

var selectedFontFamily = 'Cabin';

List fontFamily = [
  'Cabin',
  'Gwendolyn',
  'Oswald',
  'Roboto',
  'Dancing',
];

int Selecindex = 0;

List Bannerlist = [
  {
    'image': 'assets/images/hd1.jpeg',
    'bqt': "The only way to do great work is to love what you do.",
  },
  {
    'image': 'assets/images/b2.webp',
    'bqt': "Life is what happens when you're busy making other plans.",
  },
  {
    'image': 'assets/images/b1.webp',
    'bqt': "Believe you can and you're halfway there.",
  },
  {
    'image': 'assets/images/b5.webp',
    'bqt':
    "The only limit to our realization of tomorrow will be our doubts of today.",
  },
  {
    'image': 'assets/images/hd3.jpeg',
    'bqt':
    "Success is not final, failure is not fatal: It is the courage to continue that counts.",
  },
  {
    'image': 'assets/images/hd4.jpg',
    'bqt':
    '"The future belongs to those who believe in the beauty of their dreams." ',
  },
  {
    'image': 'assets/images/hd5.jpg',
    'bqt':
    "In the end, it's not the years in your life that count. It's the life in your years."
  },
];

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
Color selectColor = Colors.black;

List<GlobalKey> imgKey = List.generate(controller.QuoteList.length, (index) => GlobalKey());


List GoalImageList = [

  'assets/image/quote1.webp',
  'assets/image/quote2.webp',
  'assets/image/quote3.webp',
  'assets/image/quote4.webp',
  'assets/image/quote5.webp',
  'assets/image/quote6.webp',
  'assets/image/quote7.webp',
  'assets/image/quote8.webp',
  'assets/image/quote9.webp',
  'assets/image/quote10.webp',


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

List iconlist=[
  {
    'icon':Icons.all_inbox,
    'text':'All Inboxes',
  },
  {
    'icon':Icons.inbox,
    'text':'Inbox',
  },
  {
    'icon':Icons.star_border,
    'text':'Starred',
  },
  {
    'icon':Icons.access_time_outlined,
    'text':'Snoozed',
  },
  {
    'icon':Icons.share_outlined,
    'text':'Sent',
  },
  {
    'icon':Icons.contact_page,
    'text':'Drafts',
  },
  {
    'icon':Icons.mail,
    'text':'All Mail',
  },
  {
    'icon':Icons.error_outline_outlined,
    'text':'Spam',
  },
  {
    'icon':Icons.delete,
    'text':'Trash',
  },
  {
    'icon':Icons.add,
    'text':'Create new',
  },
  {
    'icon':Icons.calendar_today_rounded,
    'text':'Calender',
  },
  {
    'icon':Icons.account_circle_outlined,
    'text':'Contects',
  },

  {
    'icon':Icons.settings,
    'text':'Settings',
  },
];

String email='nothing entered !';
String password='nothing entered !';
var controller = Get.put(QuoteController());