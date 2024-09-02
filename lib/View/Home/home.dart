import 'package:db_minier_app/Controller/Controller.dart';
import 'package:db_minier_app/Utils/golabal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var controller=Get.put(QuoteController());

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 3),
                  ),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/like');
                      },
                      child: Icon(Icons.category)),
                ),
                SizedBox(
                  width: 5,
                ),
                categoryBox("assets/image/Explore.png", "Explore"),
                SizedBox(
                  width: 5,
                ),
                categoryBox("assets/image/fire.jpeg", "Popular"),
                SizedBox(
                  width: 5,
                ),
                categoryBox("assets/image/new.png", "Latest"),
                SizedBox(
                  width: 5,
                ),
                ...List.generate(
                  categoryList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                        onTap: () {
                          controller.categoryWish(index);
                          Navigator.of(context).pushNamed('/simple');
                        },
                        child: categoryBox(categoryList[index]['image'],
                            categoryList[index]["category"])),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.QuoteList.length,
                itemBuilder: (context, index) => Container(
                  height: 400,
                  width: 410,
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          selectedIndex=index;
                          Navigator.of(context).pushNamed('/Detail');
                        },
                        child: Container(
                          height: 340,
                          width: 410,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(GoalImageList[
                                      index % GoalImageList.length]))),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.QuoteList[index].category,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              SizedBox(height: 5),
                              Text(
                                controller.QuoteList[index].quote,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '-' +
                                    ' ' +
                                    '${controller.QuoteList[index].author}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 60,
                        width: 400,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '+29.4k',
                              style: TextStyle(color: Colors.purple),
                            ),
                            OutlinedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.share,
                                    color: Colors.purple,
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    'Share',
                                    style: TextStyle(color: Colors.purple),
                                  )
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const SingleChildScrollView(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.save_alt_outlined,
                                      color: Colors.purple,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      'Download',
                                      style: TextStyle(color: Colors.purple),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.addToFavourite(controller.QuoteList[index].isFavorite, index);
                              },
                              icon: Icon(Icons.favorite,color: (controller.QuoteList[index].isFavorite==1)?Colors.red:Colors.grey,),
                            ),
                            // IconButton(
                            //     onPressed: () {
                            //       // checking that quote exist before in list or not
                            //       controller.insertFavouriteQuote(controller.favouriteQuotes[index]);
                            //       controller.toggleColorOfFavourite(index);
                            //     },
                            //         icon: Icon(
                            //           (controller.favouriteQuotes[index].isFavorite == 0)
                            //               ? Icons.favorite_border_rounded
                            //               : Icons.favorite,
                            //           color:
                            //           (controller.favouriteQuotes[index].isFavorite == 1)
                            //               ? Colors.red
                            //               : Colors.grey,
                            //         ),
                            //   ),

                           // IconButton(
                           //        onPressed: () {
                           //          if (controller.QuoteList[index].isFavorite == 0) {
                           //            controller.favourite(
                           //                1, controller.QuoteList[index].isFavorite);
                           //            favController.insertData(
                           //              controller.QuoteList[index].quote,
                           //              controller.QuoteList[index].category,
                           //              controller.QuoteList[index].author,
                           //              controller.QuoteList[index].isFavorite,
                           //            );
                           //          } else {
                           //            controller.favourite(0, controller.QuoteList[index].isFavorite);
                           //            favController.removeFavouriteData(
                           //                favController.QuoteList[index].isFavorite);
                           //          }
                           //        },
                           //        icon: controller.dataList[index]['like'] == 0
                           //            ? const Icon(
                           //          size: 30,
                           //          Icons.favorite_border,
                           //          color: Colors.white,
                           //        )
                           //            : const Icon(
                           //          size: 30,
                           //          Icons.favorite,
                           //          color: Colors.red,
                           //        )),


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        // onTap: (index) {
        //   controller.bottomBar(index);
        //
        //   // Add your navigation logic here
        // },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack_outlined),
            label: 'Audios',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/base');
                },
                child: Icon(Icons.category)),
            label: 'Save',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Quote',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/Detail');
                },
                child: Icon(Icons.more_vert)),
            label: 'More',
          ),
        ],
      ),
    );
  }
}

Container categoryBox(String image, String text) {
  return Container(
    height: 50,
    width: 140,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white, width: 3),
    ),
    child: Row(
      children: [
        SizedBox(
          width: 5,
        ),
        CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    ),
  );
}

// int selectedIndex = 0;
