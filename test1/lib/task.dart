import 'package:flutter/material.dart';

enum Repeat {
  Monthly,
  Weakly,
  Daily,
}

class Task {
  String title = 'No Title';
  DateTime startTime;
  DateTime endTime;
  DateTime deadline;
  bool isFavorite;
  bool isComplete;
  int remind;
  Repeat repeat;
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
