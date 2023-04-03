import 'package:flutter/material.dart';
import 'list_meals.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          backgroundColor: Colors.pink,
        ),
        body: _buildBody(context),
      )
    );
  }

  Container _buildBody(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 255, 250, 200),
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisCount: 3,  
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: List.generate(DUMMY_CATEGORIES.length, (index) => _categoryBuilder(context, DUMMY_CATEGORIES[index])),
        ),
      );
  }
  Widget _categoryBuilder(BuildContext context, Category category) {
    return InkWell(
      ///Chuyển qua màn hình hiển thị các món ăn
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: ((context) => ListMealsScreen(category: category)))
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Text(category.title),
      ),
    );
  }
}