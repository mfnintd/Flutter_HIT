import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopee_food_phake/screens/order_screen.dart';

import 'data/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OrderScreen(),
    );
  }
}
