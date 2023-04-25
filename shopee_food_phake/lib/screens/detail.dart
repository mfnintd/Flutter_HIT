import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopee_food_phake/data/data.dart';

import '../data/food.dart';
import '../data/provider.dart';
import 'components.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    Food food = FoodData.listFoods[id];
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 256,
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(food.imageUlr),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(128, 0, 0, 0),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    food.describe,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        '${NumberFormat.compactCurrency(decimalDigits: 0, symbol: '')
                                .format(food.numOfSold)} đã bán | ${NumberFormat.compact()
                                .format(food.numOfLike)} lượt thích',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${NumberFormat('#,###,000').format(
                          food.cost.toDouble(),
                        )}đ',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 238, 77, 45),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          if (context
                              .watch<Cart>()
                              .quandity
                              .containsKey(food.id)) ...[
                            InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color.fromARGB(255, 238, 77, 45),
                                  ),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: const Icon(
                                  Icons.remove,
                                  color: Color.fromARGB(255, 238, 77, 45),
                                  size: 18,
                                ),
                              ),
                              onTap: () {
                                context.read<Cart>().removeFoodById(food.id);
                              },
                            ),
                            Container(
                              width: 24,
                              alignment: Alignment.center,
                              child: Text(
                                '${context.watch<Cart>().quandity[food.id]}',
                              ),
                            ),
                          ],
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 238, 77, 45),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                            onTap: () {
                              context.read<Cart>().addFoodById(food.id);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),bottomNavigationBar:
              context.watch<Cart>().totalItem == 0 ? null : bottomNav(context),
      ),
    );
  }
}
