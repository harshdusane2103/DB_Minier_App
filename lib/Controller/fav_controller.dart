import 'package:db_minier_app/Controller/Controller.dart';
import 'package:db_minier_app/Helper/fav_database.dart';
import 'package:db_minier_app/Modal/Modal.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';



class FavouriteController extends GetxController {

  RxList<QuoteModal> QuoteList = <QuoteModal>[].obs,
      likedQuotes = <QuoteModal>[].obs;
  RxList categoriesList = [].obs;
  RxList folderList = [].obs;
  RxList idList = [].obs;
  QuoteController quoteController = Get.put(QuoteController());

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> initDb() async {
    await FavouriteHelper.favouriteHelper.database;
  }
    void addToFavorite(QuoteModal quote, int index) {
    if (quote.isFavorite == 1) {
      QuoteList[index].isFavorite = 0;
      FavouriteHelper.favouriteHelper.deleteData(quote.isFavorite);
    } else {
      FavouriteHelper.favouriteHelper.favouriteDatabase();
      QuoteList[index].isFavorite = 1;
    }
    update();
    QuoteList.refresh();
  }


  // void favourite(int isFavorite, int id) {
  //   FavouriteHelper.favouriteHelper.updateData(isFavorite, id);
  //   getData();
  // }

  void folderData() {
    folderList = [].obs;
    categoriesList = [].obs;
    for (int i = 0; i < quoteController.dataList.length; i++) {
      if (quoteController.dataList[i]['like'] == 1) {
        folderList.add(quoteController.dataList[i]['category']);
      }
    }
    showFolderLikeCategory();

    print('$folderList======================================');
    print('$idList======================================');
    print('$categoriesList======================================');
  }

  Future<RxList> getData() async {
    idList.value = await FavouriteHelper.favouriteHelper.readData();
    return idList;
  }

  Future<RxList> showCategoryLikeData(String category) async {
    idList.value =
    await FavouriteHelper.favouriteHelper.showCategoryWiseData(category);
    return idList;
  }

  Future<void> insertData(String category, String quote, String author,int isFavorite) async {
    FavouriteHelper.favouriteHelper
        .insertData(category, quote, author,isFavorite);
    await getData();
  }

  void showFolderLikeCategory() {
    bool isvalue = false;
    for (int i = 0; i < folderList.length; i++) {
      for (int j = 0; j < categoriesList.length; j++) {
        if (folderList[i] == categoriesList[j]) {
          isvalue = true;
        }
      }
      if (isvalue == false) {
        categoriesList.add(folderList[i]);
      }
      isvalue = false;
    }
  }

  Future<void> removeFavouriteData(int index) async {
    folderList.removeAt(index);
    folderData();
  }

  Future<void> updateFavouriteData(int like, int id) async {
    FavouriteHelper.favouriteHelper.updateData(like, id);
    await getData();
  }

  void removeData(int id)
  {
    FavouriteHelper.favouriteHelper.deleteData(id);
    getData();
    showFolderLikeCategory();
  }
}

