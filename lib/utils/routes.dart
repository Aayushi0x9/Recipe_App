import 'package:flutter/material.dart';
import 'package:recipe_app/views/DetailPage/detail_page.dart';
import 'package:recipe_app/views/FavoutitePage/favourite_page.dart';
import 'package:recipe_app/views/HomePage/homepage.dart';
import 'package:recipe_app/views/MealPage/mealpage.dart';
import 'package:recipe_app/views/RecipePage/recipe_page.dart';

class AppRoutes {
  static String homePage = '/';
  static String detailPage = 'detail_page';
  static String recipePage = 'recipe_page';
  static String favouritePage = 'favourite_page';
  static String mealPage = 'meal_page';

  static Map<String, WidgetBuilder> routes = {
    AppRoutes.homePage: (context) => HomePage(),
    AppRoutes.detailPage: (context) => DetailPage(),
    AppRoutes.recipePage: (context) => RecipePage(),
    AppRoutes.favouritePage: (context) => FavouritePage(),
    AppRoutes.mealPage: (context) => MealPage(),
  };

  AppRoutes._();
  static final AppRoutes appRoutes = AppRoutes._();
}
