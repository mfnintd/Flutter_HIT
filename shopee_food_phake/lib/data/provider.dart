import 'package:flutter/foundation.dart';

import 'data.dart';

class Cart with ChangeNotifier, DiagnosticableTreeMixin {
  /// id => quandity
  Map<int, int> quandity = <int, int>{};

  List<int> cart = <int>[];

  int totalItem = 0;

  int totalCost = 0;

  void addFoodById(int id) {
    quandity.update(id, (value) => value + 1, ifAbsent: () => 1);
    if (!cart.contains(id)) {
      cart.add(id);
    }
    totalItem++;
    totalCost += FoodData.listFoods[id].cost;
    notifyListeners();
  }

  void removeFoodById(int id) {
    int currentQuandity = quandity[id]!;
    if (currentQuandity > 1) {
      quandity.update(id, (value) => value - 1);
    } else {
      quandity.remove(id);
      cart.remove(id);
    }
    totalItem--;
    totalCost -= FoodData.listFoods[id].cost;
    notifyListeners();
  }

  void clearAll() {
    quandity.clear();
    cart.clear();
    totalItem = 0;
    totalCost = 0;
    notifyListeners();
  }
}
