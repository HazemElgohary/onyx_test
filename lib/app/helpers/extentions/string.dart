import 'package:flutter/material.dart';

extension ToDateEx on String {
  DateTime toDate() {
    return DateTime.parse(this);
  }
}

extension ToTimeOfDay on String {
  TimeOfDay timeOfDay() {
    final finish = split(':');
    return TimeOfDay(
      hour: int.parse(finish.first),
      minute: int.parse(finish[1]),
    );
  }
}
