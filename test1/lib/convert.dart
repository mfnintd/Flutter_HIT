import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

///Convart TimeOfDay to String Format 12 Hour
String timeOfDayFormat12(TimeOfDay time) {
  DateTime tmpDate = DateTime(1, 1, 1, time.hour, time.minute);
  return DateFormat('hh:mm a').format(tmpDate);
}
