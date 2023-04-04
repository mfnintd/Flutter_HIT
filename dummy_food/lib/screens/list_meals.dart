import 'package:dummy_food/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'meal.dart';

class ListMealsScreen extends StatelessWidget {
  const ListMealsScreen({super.key, required this.category});
  final Category category;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.title),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 250, 200),
          child: ListView(
            children: [
              for (Meal item in DUMMY_MEALS)
                if (item.categories.contains(category.id))
                  _mealBuilder(context, item)
            ],
          ),
        ),
      ),
    );
  }

  Widget _mealBuilder(BuildContext context, Meal meal) {
    return InkWell(
      ///Chuyển màn qua chi tiết món ăn
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => MealScreen(meal: meal)),
          ),
        );
      },
      child: Container(
        height: 256,
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
                height: 192,
                padding: const EdgeInsets.only(bottom: 16),
                alignment: Alignment.bottomRight,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage(meal.imageUrl),
                  fit: BoxFit.cover,
                )),
                child: Container(
                  constraints: const BoxConstraints(
                    minWidth: 0.0,
                    maxWidth: double.infinity,
                    minHeight: 0.0,
                    maxHeight: double.infinity,
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(128, 0, 0, 0),
                  ),
                  child: SizedBox(
                    width: 256,
                    child: Text(
                      meal.title,
                      style: const TextStyle(color: Colors.white, fontSize: 32),
                    ),
                  ),
                )),
            _mealInformation(meal)
          ],
        ),
      ),
    );
  }

  Container _mealInformation(Meal meal) {
    return Container(
      color: Colors.white,
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: const Icon(
                  Icons.schedule,
                  size: 16,
                ),
              ),
              Text('${meal.duration} min')
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: const Icon(
                  Icons.work,
                  size: 16,
                ),
              ),
              Text(meal.complexity.name)
            ],
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                child: const Icon(
                  Icons.attach_money,
                  size: 16,
                ),
              ),
              Text(meal.affordability.name)
            ],
          )
        ],
      ),
    );
  }
}
