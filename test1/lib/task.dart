import 'package:flutter/material.dart';

final List<String> remindItems = <String>[
  '10 minutes early',
  '30 minutes early',
  '1 hour early'
];
final List<String> repeatItems = <String>['Weakly', 'Monthly', 'Yearly'];
final List<Color> colorItems = <Color>[
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.purple
];

class Task {
  String title = 'No Title';
  TimeOfDay startTime;
  TimeOfDay endTime;
  DateTime deadline;
  bool isFavorite;
  bool isComplete;
  String remind;
  String repeat;
  Color color;
  Task(
      {required this.title,
      required this.startTime,
      required this.endTime,
      required this.deadline,
      required this.isFavorite,
      required this.isComplete,
      required this.remind,
      required this.repeat,
      required this.color});
}
