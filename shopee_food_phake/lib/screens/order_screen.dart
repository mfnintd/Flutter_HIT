import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/food.dart';
import '../data/data.dart';
import '../data/provider.dart';
import 'components.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: FoodData.typeOfFood.length,
      initialIndex: 0,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.share,
                  size: 30,
                  color: Color.fromARGB(255, 238, 77, 45),
                ),
              )
            ],
            backgroundColor: Colors.white,
            bottom: TabBar(
              labelColor: const Color.fromARGB(255, 238, 77, 45),
              unselectedLabelColor: Colors.black,
              indicatorColor: const Color.fromARGB(255, 238, 77, 45),
              isScrollable: true,
              tabs: List.generate(
                FoodData.typeOfFood.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    FoodData.typeOfFood[index],
                  ),
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: List.generate(
              FoodData.typeOfFood.length,
              (index) {
                List<Food> tmp = FoodData.listFoods
                    .where((element) => element.type == index)
                    .toList();
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Title(
                          color: Colors.black,
                          child: Text(
                            '${FoodData.typeOfFood[index]} (${tmp.length})',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: tmp.length,
                        padding: const EdgeInsets.all(8),
                        itemBuilder: (context, index) => Column(children: [
                          foodBuilder(context, tmp[index]),
                          const Divider(),
                        ]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          bottomNavigationBar:
              context.watch<Cart>().totalItem == 0 ? null : bottomNav(context),
        ),
      ),
    );
  }
}
