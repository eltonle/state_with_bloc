import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
InputField({
  required double width,
  required TextEditingController controller,
  required String hintText,
  bool isObscure = false,
}) {
  return Container(
    width: width * 0.8,
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
        hintText: hintText,
        border: InputBorder.none,
      ),
      obscureText: isObscure,
    ),
  );
}
