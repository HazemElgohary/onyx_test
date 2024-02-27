import 'package:flutter/material.dart';
import 'package:onyx_test/app/config/theme.dart';

class DefaultButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool loading;
  final double? width;

  const DefaultButton({
    super.key,
    required this.onTap,
    required this.text,
    this.loading = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Center(
          child: loading
              ? const CircularProgressIndicator()
              : Text(
                  text,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
