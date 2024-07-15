import 'package:flutter/material.dart';
import 'package:recipe_app/utils/allrecipe.dart';

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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...favourite.map(
              (e) => Container(
                margin: const EdgeInsets.only(top: 10, left: 16, right: 16),
                height: size.height * 0.2,
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
                      child: Column(
                        children: [
                          Text('${e['name']}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
