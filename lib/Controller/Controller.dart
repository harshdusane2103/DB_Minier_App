import 'dart:convert';

import 'package:db_minier_app/Helper/Database.dart';
import 'package:db_minier_app/Modal/Modal.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class QuoteController extends GetxController {
  bool isFavorite=false;
  List<QuoteModal> QuoteList = [];
 RxList<QuoteModal> Quote = <QuoteModal>[].obs;
  var selectedThemeimage = 'assets/images/th11.webp';

  var selectedFontFamily = 'Cabin';
  RxList<QuoteModal> favouriteQuotes = <QuoteModal>[].obs;
  RxList<String> favouriteCategories = <String>[].obs;
  RxList<String> initialImages = <String>[].obs;

  // RxList<QuoteModal> favouriteQuotes = <QuoteModal>[].obs;
  // RxList<String> favouriteCategories = <String>[].obs;
  RxInt indexForGlobalUse = 0.obs;
  int check = 0;
  RxString expandedCategory = ''.obs;

  Future<List> jsonparsing() async {
    String json = await rootBundle.loadString('assets/Json/quote.json');
    List data = jsonDecode(json);
    return data;
  }

  Future<List<QuoteModal>> QuoteData() async {
    List Photo = await jsonparsing();
    QuoteList = Photo.map((e) => QuoteModal.fromJson(e)).toList();
    print(QuoteList);
    return QuoteList;
  }

  void SelectedImage(int index) {
    selectedThemeimage = BgimgList[index];
  }

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

  List BgimgList = [
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
  ];

  void checkFavouriteExistBefore(QuoteModal quote) {
    check = 0;
    for (int i = 0; i < favouriteQuotes.length; i++) {
      if (quote.quote == favouriteQuotes[i].quote) {
        check = 1;

      }
    }
    if (check == 0) {
      insertFavouriteQuote(quote);
      check = 1;
    }
  }

  Future<void> deleteFavouriteQuote(int id) async {
    await DatabaseHelper.databaseHelper.deleteFavouriteQuote(id);
    readFavouriteQuote();

  }

  void toggleColorOfFavourite(int index) {
    [index].isFavorite = true;
    Quote.refresh();
  }

  Future<void> insertFavouriteQuote(QuoteModal quote) async {
    await DatabaseHelper.databaseHelper.addFavouriteInDatabase(
        quote.quote, quote.author, quote.category, quote.isFavorite ? 0 : 1);

    readFavouriteQuote();
  }

  Future<void> readFavouriteQuote() async {
    favouriteQuotes.value =
        await DatabaseHelper.databaseHelper.readFavouriteQuotes();
  }

  QuoteController() {
    QuoteData();
  }
}

extension on List<int> {
  set isFavorite(bool isFavorite) {}
}
