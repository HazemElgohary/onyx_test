import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:onyx_test/app/config/theme.dart';

class SegmentationsCard extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const SegmentationsCard({
    Key? key,
    required this.title,
    required this.selected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width * 0.3,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          color: selected ? AppColors.primary : null,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: selected ? AppColors.whiteColor : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
