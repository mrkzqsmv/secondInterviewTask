import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final dynamic controller;
  final dynamic hintText;
  final dynamic prefixIcon;
  final dynamic bgColor;
  final dynamic hintTextColor;
  final dynamic iconColor;
  final dynamic width;
  final dynamic height;
  final dynamic onTap;
  final dynamic borderColor;
  final dynamic readOnly;

  const TextFormFieldWidget(
      {super.key,
      this.controller,
      this.hintText,
      this.prefixIcon,
      this.bgColor,
      this.hintTextColor,
      this.width,
      this.height,
      this.iconColor,
      this.onTap,
      this.borderColor,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        onTap();
      },
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: bgColor,
          filled: true,
          hintText: hintText,
          prefixIcon: prefixIcon,
          iconColor: iconColor,
          hintStyle: TextStyle(
            color: hintTextColor,
          )),
      readOnly: readOnly,
      controller: controller,
    );
  }
}
