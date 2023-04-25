import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/data.dart';
import '../data/food.dart';
import '../data/provider.dart';

class CartDisplay extends StatelessWidget {
  const CartDisplay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'Giỏ hàng',
          style: TextStyle(
            fontSize: 14,
          ),
        ),
        leadingWidth: 70,
        leading: TextButton(
          onPressed: () {
            context.read<Cart>().clearAll();
            Navigator.pop(context);
          },
          child: const Text(
            'Xóa tất cả',
            style: TextStyle(
              color: Color.fromARGB(255, 238, 77, 45),
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: context.watch<Cart>().cart.length,
        itemBuilder: (context, index) {
          Food food = FoodData.listFoods[context.watch<Cart>().cart[index]];
          return SizedBox(
            height: 50,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Image(
                    image: NetworkImage(food.imageUlr),
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
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
                                    context
                                        .read<Cart>()
                                        .removeFoodById(food.id);
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
                )
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: _bottomNav(context),
    );
  }
}

Widget _bottomNav(BuildContext context) {
  return SizedBox(
    height: 40,
    child: Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              const SizedBox(
                height: 40,
                width: 40,
                child: Icon(
                  Icons.shopping_cart_outlined,
                  size: 32,
                  color: Color.fromARGB(255, 238, 77, 45),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 238, 77, 45),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '${context.watch<Cart>().totalItem}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
              )
            ],
          ),
        ),
        const Expanded(child: SizedBox()),
        Text(
          '${NumberFormat('#,###,000').format(
            context.watch<Cart>().totalCost.toDouble(),
          )}đ',
          style: const TextStyle(
            color: Color.fromARGB(255, 238, 77, 45),
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: InkWell(
            onTap: () {},
            child: Container(
              height: 40,
              width: 100,
              alignment: Alignment.center,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(255, 238, 77, 45)),
              child: const Text(
                'Giao hàng',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
