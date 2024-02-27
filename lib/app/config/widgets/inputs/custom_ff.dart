import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onyx_test/app/config/theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final bool showPassword;
  final bool isNumber;
  final bool isEmail;
  final bool enable;
  final VoidCallback? onSuffixPress;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int lines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.enable = true,
    this.isPassword = false,
    this.showPassword = false,
    this.isNumber = false,
    this.isEmail = false,
    this.onSuffixPress,
    required this.validator,
    this.inputFormatters,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      cursorHeight: 20,
      obscureText: isPassword && showPassword,
      validator: validator,
      // enabled: enable,
      maxLines: lines,
      keyboardType: isNumber
          ? TextInputType.number
          : isEmail
              ? TextInputType.emailAddress
              : TextInputType.text,
      inputFormatters: isNumber
          ? [
              FilteringTextInputFormatter.allow(RegExp('[0-9]')),
            ]
          : inputFormatters,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: AppColors.secondColor,
        isDense: false,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide.none,
        ),
        disabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide.none,
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide.none,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
        constraints: const BoxConstraints(
          minHeight: 40,
        ),
      ),
    );
  }
}
