import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/extention.dart';
import 'package:recipe_app/utils/allrecipe.dart';
import 'package:recipe_app/utils/routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.mealPage);
            },
            icon: Icon(
              Icons.set_meal_rounded,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favouritePage);
            },
            icon: Icon(
              Icons.favorite_rounded,
              color: Colors.red,
              size: 25,
            ),
          ),
          10.ofWidth,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 7,
                  mainAxisSpacing: 7,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: allRecipies.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.detailPage,
                        arguments: allRecipies[index]);
                  },
                  child: Container(
                    height: size.height * 0.22,
                    width: size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(3, 3),
                            blurRadius: 5,
                          ),
                        ]),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.13,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(allRecipies[index]['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('${allRecipies[index]['name']}'),
                            Row(
                              children: [
                                Text('${allRecipies[index]['tags'][0]},'),
                                5.ofWidth,
                                Text('${allRecipies[index]['tags'][1]}'),
                              ],
                            ),
                            Text('${allRecipies[index]['mealType'][0]}'),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: allRecipies[index]['rating'],
                                  itemBuilder: (context, index) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  itemCount: 5,
                                  itemSize: 20.0,
                                  direction: Axis.horizontal,
                                ),
                                5.ofWidth,
                                Text(
                                  '(${allRecipies[index]['rating']})',
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Add to'),
                                IconButton(
                                  onPressed: () {
                                    favourite.add(allRecipies[index]);
                                  },
                                  icon: Icon(Icons.favorite_rounded),
                                ),
                                IconButton(
                                  onPressed: () {
                                    meal.add(allRecipies[index]);
                                  },
                                  icon: Icon(Icons.set_meal_rounded),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
