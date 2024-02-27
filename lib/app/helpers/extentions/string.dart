import 'package:flutter/material.dart';
import 'package:onyx_test/app/helpers/enums.dart';

extension ToDateEx on String {
  DateTime toDate() {
    return DateTime.parse(this);
  }

  TimeOfDay timeOfDay() {
    final finish = split(':');
    return TimeOfDay(
      hour: int.parse(finish.first),
      minute: int.parse(finish[1]),
    );
  }

  BillStatus toBillStatus() {
    return switch (this) {
      '0' => BillStatus.New,
      '1' => BillStatus.Delivered,
      '2' => BillStatus.Delivering,
      String() => BillStatus.Returned,
    };
  }
}
