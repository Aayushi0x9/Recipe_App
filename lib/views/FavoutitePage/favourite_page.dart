import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/extention.dart';
import 'package:recipe_app/utils/allrecipe.dart';
import 'package:recipe_app/utils/routes.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Recipe'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.mealPage);
            },
            icon: const Icon(
              Icons.set_meal_rounded,
              color: Colors.teal,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.homePage);
            },
            icon: const Icon(
              Icons.home,
              // color: Colors.blue,
              size: 25,
            ),
          ),
          10.ofWidth,
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...favourite.map(
              (e) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.detailPage);
                },
                child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                  height: size.height * 0.245,
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.network(
                          e['image'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, left: 10, right: 6, bottom: 5),
                          child: Column(
                            children: [
                              Text(
                                '${e['name']}',
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              10.ofHeight,
                              RichText(
                                text: TextSpan(
                                  children: [
                                    const TextSpan(
                                      text: 'Prepare Time Minutes',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\t\t${e['prepTimeMinutes']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    const TextSpan(
                                      text: '\nCook Time Minutes',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\t\t\t\t\t${e['cookTimeMinutes']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\n${e['tags'][0]},',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\t${e['tags'][1]}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\n${e['mealType'][0]}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Servings',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if ((e['servings'] ?? 0) > 1) {
                                        e['servings'] =
                                            (e['servings'] ?? 0) - 1;

                                        setState(() {
                                          // totalServings = int.parse(
                                          //         e['servings'].toString()) -
                                          //     1;
                                        });
                                      }
                                    },
                                    icon:
                                        const Icon(CupertinoIcons.minus_circle),
                                  ),
                                  Text(
                                    '${e['servings']}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      if ((e['servings'] ?? 0) < 10) {
                                        // Assuming max servings is 10
                                        e['servings'] =
                                            (e['servings'] ?? 0) + 1;
                                        setState(() {});
                                      }
                                    },
                                    icon:
                                        const Icon(CupertinoIcons.plus_circle),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text('Add to'),
                                  IconButton(
                                    onPressed: () {
                                      favourite.contains(e)
                                          ? favourite.remove(e)
                                          : favourite.add(e);
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.favorite_rounded,
                                      color: favourite.contains(e)
                                          ? Colors.red
                                          : Colors.grey.shade700,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      meal.contains(e)
                                          ? meal.remove(e)
                                          : meal.add(e);
                                      setState(() {});
                                    },
                                    icon: Icon(Icons.set_meal_rounded,
                                        color: meal.contains(e)
                                            ? Colors.teal
                                            : Colors.grey.shade700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
