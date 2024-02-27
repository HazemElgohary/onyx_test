import 'package:flutter/material.dart';
import 'package:onyx_test/app/modules/home/models/delivery_bill_model.dart';
import 'package:onyx_test/app/modules/home/views/widgets/bill_item.dart';

class BillsListView extends StatelessWidget {
  final List<DeliveryBillsModel> bills;
  const BillsListView({super.key, required this.bills});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BillItem(bill: bills[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 20),
      itemCount: bills.length,
    );
  }
}
