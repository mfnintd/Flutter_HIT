import 'package:chuabaibuoi4/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'listmeals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Categories'),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemCount: DUMMY_CATEGORIES.length,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ListMealsScreen(item: DUMMY_CATEGORIES[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: DUMMY_CATEGORIES[index].color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                child: Text(
                  DUMMY_CATEGORIES[index].title,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
