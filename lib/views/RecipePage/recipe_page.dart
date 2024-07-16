import 'package:flutter/material.dart';
import 'package:recipe_app/extention.dart';
import 'package:recipe_app/utils/allrecipe.dart';
import 'package:recipe_app/utils/routes.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    Map<String, dynamic> recipe =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(
        title: Text('${recipe['name']}'),
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
            padding: EdgeInsets.only(top: 45, left: 45, right: 45, bottom: 16),
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
                  '${recipe['name'].toString().toUpperCase()}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                text: '\t\t${recipe['prepTimeMinutes']}',
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
                                text: '\t\t\t\t\t${recipe['cookTimeMinutes']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        const Text(
                          'Cooking Details',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              const TextSpan(
                                text: 'Difficulty',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t${recipe['difficulty']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),
                              ),
                              const TextSpan(
                                text: '\nCuisine',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t\t${recipe['cuisine']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),
                              ),
                              const TextSpan(
                                text: '\nServings',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: '\t\t\t${recipe['servings']}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        10.ofHeight,
                        Text(
                          'Ingredients 🛒',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.ofHeight,
                        ...List.generate(
                          recipe['ingredients'].length,
                          (index) => Text(
                            '${index + 1}\t\t${recipe['ingredients'][index]}',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                        10.ofHeight,
                        Text(
                          'Instructions 📝',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        5.ofHeight,
                        ...List.generate(
                          recipe['instructions'].length,
                          (index) => Text(
                            '${index + 1}\t\t${recipe['instructions'][index]}',
                            style: TextStyle(
                              color: Colors.blue.shade700,
                            ),
                          ),
                        ),
                        30.ofHeight,
                      ],
                    ),
                  ),
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
          )
        ],
      ),
    );
  }
}
