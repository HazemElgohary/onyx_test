import 'package:flutter/material.dart';
import 'package:onyx_test/app/config/theme.dart';
import 'package:onyx_test/app/helpers/extentions/enum.dart';
import 'package:onyx_test/app/modules/home/models/delivery_bill_model.dart';

class BillItem extends StatelessWidget {
  final DeliveryBillsModel bill;

  const BillItem({super.key, required this.bill});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Container(
            height: size.height * 0.12,
            padding: const EdgeInsetsDirectional.only(start: 20),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFF808080),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: Offset(5, 5),
                ),
              ],
              borderRadius: BorderRadius.circular(8),
              color: AppColors.whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '#${bill.billNo}',
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0XFFebebeb),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: BillItemField(
                        title: 'Status',
                        value: bill.status.name,
                        color: bill.status.getBillColor(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: size.height * 0.06,
                        width: 1,
                        color: const Color(0xFF808080),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 3,
                      child: BillItemField(
                        title: 'Total Price',
                        value: '${double.parse(bill.billAMT).toStringAsFixed(0)} LE',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: size.height * 0.06,
                        width: 1,
                        color: const Color(0xFF808080),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 3,
                      child: BillItemField(
                        title: 'Date',
                        value: bill.billDate,
                      ),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.12,
            decoration: BoxDecoration(
              color: bill.status.getBillColor(),
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(8),
                bottomEnd: Radius.circular(8),
              ),
            ),
            child: const SizedBox(width: 40),
          ),
        ],
      ),
    );
  }
}

class BillItemField extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const BillItemField({
    super.key,
    required this.title,
    required this.value,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0XFFebebeb),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color ?? AppColors.primary,
          ),
        ),
      ],
    );
  }
}
