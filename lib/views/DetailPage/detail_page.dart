import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:recipe_app/extention.dart';
import 'package:recipe_app/utils/allrecipe.dart';
import 'package:recipe_app/utils/routes.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> recipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
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
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(10),
            height: size.height * 0.3,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
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
                  recipe['image'],
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(45),
            height: size.height * 0.55,
            width: size.width,
            decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(45)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    offset: const Offset(0, -3),
                    blurRadius: 5,
                  ),
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${recipe['name']}',
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: recipe['rating'],
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
                      '(${recipe['rating']})',
                      style: const TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                const Divider(
                  thickness: 0.6,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Cooking Details',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Difficulty',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t${recipe['difficulty']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              const TextSpan(
                                text: '\nCuisine',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t\t${recipe['cuisine']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              const TextSpan(
                                text: '\nServings',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t${recipe['servings']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        const Text(
                          'Cooking Time',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Prepare Time Minutes',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t${recipe['prepTimeMinutes']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              const TextSpan(
                                text: '\nCook Time Minutes',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t\t\t${recipe['cookTimeMinutes']}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        const Text(
                          'Need',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Ingredients',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t${(recipe['ingredients']).length}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              const TextSpan(
                                text: '\nInstruction',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text:
                                    '\t\t\t\t${(recipe['instructions']).length}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        Text(
                          'Type',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${recipe['tags'][0]},',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t\t\t${recipe['tags'][1]}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        const Text(
                          'MealType',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${recipe['mealType'][0]}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        const Text(
                          'Review ⭐',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${recipe['reviewCount']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.recipePage,
                            arguments: recipe);
                      },
                      icon: const Icon(Icons.play_arrow_rounded),
                      label: const Text('Start'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        meal.contains(recipe)
                            ? meal.remove(recipe)
                            : meal.add(recipe);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.set_meal_rounded,
                        color: meal.contains(recipe)
                            ? Colors.teal
                            : Colors.grey.shade700,
                      ),
                      label: Text(
                        'Add to Meal',
                        style: TextStyle(
                          color: meal.contains(recipe)
                              ? Colors.teal
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        favourite.contains(recipe)
                            ? favourite.remove(recipe)
                            : favourite.add(recipe);
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: favourite.contains(recipe)
                            ? Colors.red
                            : Colors.grey.shade700,
                      ),
                      label: Text(
                        'Add to Favourite',
                        style: TextStyle(
                          color: favourite.contains(recipe)
                              ? Colors.red
                              : Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
