import 'dart:convert';

import 'package:db_minier_app/Helper/Database.dart';
import 'package:db_minier_app/Modal/Modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QuoteController extends GetxController {
  RxList<QuoteModal> QuoteList = <QuoteModal>[].obs,
      likedQuotes = <QuoteModal>[].obs;
  RxList<QuoteModal> quotes = <QuoteModal>[].obs;

  RxList<QuoteModal> favouriteQuotes = <QuoteModal>[].obs;
  RxList<String> favouriteCategories = <String>[].obs;
  RxInt indexForGlobalUse = 0.obs;
  int check = 0;
  RxString expandedCategory = ''.obs;
  RxInt isLikes = 0.obs;
  RxList simpleQuoteList = [].obs;

  RxList data = [].obs;

  late QuoteModal quotesModal;
  RxList dataList = [].obs;

  @override
  void onInit() {
    super.onInit();
    initDb();
    QuoteData();
    readFavouriteQuote();
  }

  void categoryWish(int index) {
    simpleQuoteList.clear();
    for (int i = 0; i < QuoteList.length; i++) {
      if (categoryList[index]["category"] == QuoteList[i].category) {
        simpleQuoteList.add({
          'category': QuoteList[i].category,
          'quote': QuoteList[i].quote,
          'author': QuoteList[i].author,
          'isFavorite': QuoteList[i].isFavorite
        });
      }
    }
    print(simpleQuoteList);
  }

  Future<List> jsonparsing() async {
    String json = await rootBundle.loadString('assets/Json/quote.json');
    List data = jsonDecode(json);
    return data;
  }

  Future<void> QuoteData() async {
    List Photo = await jsonparsing();
    QuoteList.value = Photo.map((e) => QuoteModal.fromJson(e)).toList();
    // return QuoteList;
  }

  void addToFavourite(int value, int index) {
    if (value == 1) {
      QuoteList[index].isFavorite = 0;
    } else {
      QuoteList[index].isFavorite = 1;
    }
    QuoteList.refresh(); // Use refresh to trigger the update
    update();
  }

  // Method to set the expanded category
  void setExpandedCategory(String category) {
    expandedCategory.value = category;
  }

  Future initDb() async {
    await DatabaseHelper.databaseHelper.database;
  }

  void checkFavouriteExistBefore(QuoteModal quote) {
    check = 0;
    for (int i = 0; i < favouriteQuotes.length; i++) {
      if (quote.quote == favouriteQuotes[i].quote) {
        check = 1;
        // Get.snackbar('Already', 'The quote is already added to favourite!',
        // snackPosition: SnackPosition.BOTTOM,
        // colorText: CupertinoColors.white);
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
    // Get.snackbar(
    // 'Removed',
    // 'Quote removed from favourite',
    // snackPosition: SnackPosition.BOTTOM,
    // colorText: CupertinoColors.white,
    // );
  }

  void toggleColorOfFavourite(int index) {
    quotes[index].isFavorite = 0;
    quotes.refresh();
  }

  Future<void> insertFavouriteQuote(QuoteModal quote) async {
    await DatabaseHelper.databaseHelper.addFavouriteInDatabase(
        quote.quote, quote.author, quote.category, quote.isFavorite);
    // Get.snackbar('Added!', 'Quote added to favourite',
    // snackPosition: SnackPosition.BOTTOM, colorText: CupertinoColors.white);
    readFavouriteQuote();
  }

  Future<void> readFavouriteQuote() async {
    favouriteQuotes.value =
        await DatabaseHelper.databaseHelper.readFavouriteQuotes();
  }
}

int selectedIndex = 0;
List categoryList = [
  {"category": "Love", "image": "assets/image/Love.jpeg"},
  {"category": "Sad", "image": "assets/image/sad.png"},
  {"category": "Positive", "image": "assets/image/positive.png"},
  {"category": "Family", "image": "assets/image/family.png"},
  {"category": "Wisdom", "image": "assets/image/wisdom.jpeg"},
  {"category": "Attitude", "image": "assets/image/Attiude.jpeg"},
  {"category": "People", "image": "assets/image/people.png"},
  {"category": "Motivation", "image": "assets/image/motivation.png"},
];
