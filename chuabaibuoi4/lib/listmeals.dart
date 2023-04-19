import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'dummy_data.dart';
import 'meals.dart';

class ListMealsScreen extends StatelessWidget {
  const ListMealsScreen({super.key, required this.item});
  final Category item;
  @override
  Widget build(BuildContext context) {
    List<Meal> hihi = DUMMY_MEALS
        .where(
          (element) => element.categories.contains(item.id),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: hihi.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MealScreen(item: hihi[index]),
                ));
          },
          child: Container(
            height: 128,
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  hihi[index].imageUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Text(hihi[index].title),
          ),
        ),
      ),
    );
  }
}
