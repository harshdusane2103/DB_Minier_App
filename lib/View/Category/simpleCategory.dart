
import 'package:db_minier_app/Controller/Controller.dart';

import 'package:db_minier_app/Utils/golabal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
var controller=Get.put(QuoteController());
class SimplecategoryScreen extends StatelessWidget {
  const SimplecategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Obx(
            () =>  ListView.builder(
          itemCount: controller.simpleQuoteList.length,
          itemBuilder: (context, index) => Container(
            height: 404,
            width: 410,
            decoration: BoxDecoration(
              // color: Colors.red,
            ),
            child: Column(
              children: [
                Container(height: 4,width: 410,decoration: BoxDecoration(color: Colors.grey),),
                InkWell(
                  onTap: () {
                    // Navigator.of(context).pushNamed('/Detail');
                  },
                  child: Container(
                    height: 340,
                    width: 410,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                GoalImageList[index % GoalImageList.length]))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          controller.simpleQuoteList[index]['category'],
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text(
                          controller.simpleQuoteList[index]['quote'],
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '-' + ' ' + '${controller.simpleQuoteList[index]['author']}',
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
                      // GetBuilder<QuoteController>(
                      //   builder: (controller) =>
                      //    IconButton(
                      //     onPressed: () {
                      //       favController.addToFavorite(
                      //           controller.QuoteList[index],
                      //           index);
                      //     },
                      //     icon: Icon(
                      //       (controller.QuoteList[index].isFavorite == 0) ? Icons.favorite_border_rounded : Icons.favorite,
                      //       color: (controller.QuoteList[index].isFavorite == 1)
                      //           ? Colors.red
                      //           : Colors.grey,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
