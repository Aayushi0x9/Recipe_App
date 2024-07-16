import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/extention.dart';
import 'package:recipe_app/utils/allrecipe.dart';
import 'package:recipe_app/utils/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.mealPage);
            },
            icon: const Icon(
              Icons.set_meal_rounded,
              size: 25,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.favouritePage);
            },
            icon: const Icon(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              initialValue: 'Search',
              // onChanged: (val) => Globals.globals.SearchData = val,
              decoration: InputDecoration(
                  prefixIcon: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.search)),
                  label: const Text('Search Product'),
                  hintText: 'Search Product',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.black,
                        width: 2,
                      ))),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '\t\tPopular Recipies',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: size.height * 0.2,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
              items: List.generate(
                allRecipies.length,
                (index) => Container(
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(3, 3),
                        blurRadius: 2,
                      ),
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                            allRecipies[(allRecipies.length - 1) - index]
                                ['image']),
                        fit: BoxFit.fill),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '\t${allRecipies[(allRecipies.length - 1) - index]['name']}  ',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        backgroundColor: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              '\t\tRecent Recipies',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            Text(
                              '${allRecipies[index]['name']}',
                              overflow: TextOverflow.ellipsis,
                            ),
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
                                  itemBuilder: (context, index) => const Icon(
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
                                  style: const TextStyle(
                                    color: Colors.blue,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Add to'),
                                IconButton(
                                  onPressed: () {
                                    favourite.contains(allRecipies[index])
                                        ? favourite.remove(allRecipies[index])
                                        : favourite.add(allRecipies[index]);
                                    setState(() {});
                                  },
                                  icon: Icon(
                                    Icons.favorite_rounded,
                                    color:
                                        favourite.contains(allRecipies[index])
                                            ? Colors.red
                                            : Colors.grey.shade700,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    meal.contains(allRecipies[index])
                                        ? meal.remove(allRecipies[index])
                                        : meal.add(allRecipies[index]);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.set_meal_rounded,
                                      color: meal.contains(allRecipies[index])
                                          ? Colors.teal
                                          : Colors.grey.shade700),
                                ),
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
