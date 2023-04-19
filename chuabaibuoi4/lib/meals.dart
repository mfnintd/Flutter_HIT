import 'package:chuabaibuoi4/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.item});
  final Meal item;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
    );
  }
}
