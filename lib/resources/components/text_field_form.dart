import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:ridesharingapp/utils/utils.dart';

class AppTextFormField extends StatelessWidget {
  AppTextFormField(
      {super.key,
      required this.focusNode,
      required this.controller,
      required this.hintText,
      required this.onSubmit,
      required this.regExp,
      this.obscureText = false});
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final Function(String value) onSubmit;
  RegExp regExp;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter $hintText';
          }
          if (!regExp.hasMatch(value)) {
            return 'Please enter valid $hintText';
          }
          return null;
        },
        onFieldSubmitted: (value) => onSubmit(value),
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ));
  }
}
