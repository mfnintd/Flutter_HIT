import 'package:dummy_food/data/dummy_data.dart';
import 'package:flutter/material.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({
    super.key,
    required this.meal,
  });
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
          backgroundColor: Colors.pink,
        ),
        body: Container(
          color: const Color.fromARGB(255, 255, 250, 200),
          child: Column(
            children: [
              Container(
                height: 256,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(meal.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: const Text('Ingredients')
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.all(4),
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(meal.ingredients[index])
                          ),
                        ],
                      ),
                    );
                  }
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8),
                child: const Text('Steps')
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: meal.steps.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 138, 4, 67)
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '# ${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            meal.steps[index],
                          ),
                        ),
                      ],
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}