import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderringScreen extends StatefulWidget {
  const OrderringScreen({super.key});

  @override
  State<OrderringScreen> createState() => _OrderringScreenState();
}

class _OrderringScreenState extends State<OrderringScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView,
        bottomNavigationBar: botNav(context),
      ),
    );
  }
}