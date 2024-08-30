import 'package:db_minier_app/Utils/golabal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   bottom: PreferredSize(preferredSize:Size(0, 10) , child:
      //
      //   ),
      // ),
      // drawer: Drawer(
      //   child: SingleChildScrollView(
      //     child: Column(
      //       children: [
      //         DrawerHeader(
      //           child: Text(
      //             'Gmail',
      //             style: TextStyle(color: Colors.red, fontSize: 24),
      //           ),
      //         ),
      //         ...List.generate(
      //           iconlist.length,
      //           (index) => ListTile(
      //             leading: Icon(iconlist[index]['icon']),
      //             title: Text(iconlist[index]['text']),
      //             tileColor: Colors.black,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          SizedBox(height: 50),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(Icons.menu, color: Colors.black),
                  ),
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
                categoryBox("assets/image/happy.png", "Happy"),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                    onTap: () {

                    },
                    child: categoryBox("assets/image/people.png", "People")),
                SizedBox(
                  width: 5,
                ),
                categoryBox("assets/image/positive.png", "Positive"),
                SizedBox(
                  width: 5,
                ),
                categoryBox("assets/image/wisdom.jpeg", "Wisdom"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.QuoteList.length,
              itemBuilder: (context, index) => Container(
                height: 400,
                width: 410,
                decoration: BoxDecoration(
                  // color: Colors.red,
                ),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/Detail');
                      },
                      child: Container(
                        height: 340,
                        width: 410,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(controller.GoalImageList[index % 10]))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              controller.QuoteList[index].category,
                              style: TextStyle(
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
                              '-' + ' ' + '${controller.QuoteList[index].author}',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                            child: SingleChildScrollView(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              // checking that quote exists in the list or not
                              controller.checkFavouriteExistBefore(
                                  controller.QuoteList[index]);
                              controller.toggleColorOfFavourite(index);
                            },
                            icon: (controller.QuoteList[index].isFavorite)
                                ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                              size: 24,
                            )
                                : const Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.purple,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
        //
        //   selectedIndex = index;
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
            icon: Icon(Icons.bookmarks),
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
    width: 120,
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
          width: 5,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ],
    ),
  );
}

int selectedIndex = 0;
