import 'package:flutter/material.dart';
import 'package:todo/model/input_types.dart';
import 'package:todo/colors.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.type,
    required this.controller,
    required this.isFocused,
    required this.focusNode,
  });

  final InputType type;
  final TextEditingController controller;
  final bool isFocused;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: type.labelText,
        hintText: type.hintText,
        filled: true,
        enabledBorder: controller.text != ""
            ? const OutlineInputBorder(
                borderSide: BorderSide(
                width: 2,
                color: AppColors.success,
              ))
            : null,
        floatingLabelStyle: isFocused
            ? const TextStyle(
                color: AppColors.primary,
              )
            : controller.text != ""
                ? const TextStyle(
                    color: AppColors.success,
                  )
                : null,
        fillColor: isFocused || controller.text != ""
            ? AppColors.background1
            : AppColors.background2,
      ),
      keyboardType: TextInputType.visiblePassword,
      obscureText: type.obscureText,
      controller: controller,
      focusNode: focusNode,
    );
  }
}
