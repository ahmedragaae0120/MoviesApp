import 'package:flutter/material.dart';

typedef ValidationFieled = String? Function(String?)?;

// ignore: must_be_immutable
class CustomTextFiled extends StatelessWidget {
  String hintText;
  TextInputType keyboard;
  TextEditingController textController;
  bool? obscureText;
  Widget? suffixIcon;
  ValidationFieled validator;
  CustomTextFiled({
    super.key,
    required this.hintText,
    required this.keyboard,
    required this.textController,
    this.obscureText = false,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displayMedium,
        suffixIcon: suffixIcon,
        disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
        border: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.white)),
      ),
      style: Theme.of(context).textTheme.displayMedium,
      keyboardType: keyboard,
      controller: textController,
      obscureText: obscureText??false,
      obscuringCharacter: "*",
      validator: validator,
    );
  }
}
