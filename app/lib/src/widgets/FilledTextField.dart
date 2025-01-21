import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class FilledTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool obscureText;
  final int? maxLines;

  const FilledTextField({super.key, this.controller, this.hintText, this.obscureText=false, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        filled: true,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(12))),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black45),
      ),
    );
  }
}
