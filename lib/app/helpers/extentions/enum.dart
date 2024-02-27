import 'package:flutter/material.dart';
import 'package:onyx_test/app/helpers/enums.dart';

extension GetColor on BillStatus {
  Color getBillColor() {
    return switch (this) {
      BillStatus.New => const Color(0xFF29d40b),
      BillStatus.Delivered => const Color(0xFF707070),
      BillStatus.Delivering => const Color(0xFF024f62),
      BillStatus.Returned => const Color(0xFFd4290e),
    };
  }
}
