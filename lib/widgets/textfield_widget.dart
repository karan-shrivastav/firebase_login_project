import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  const TextfieldWidget({
    super.key,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(0xfff4f4f4f),
        ),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.location_on_outlined),
          fillColor: const Color(0xff1a1a1a),
          hintStyle: const TextStyle(
            fontSize: 13,
          ),
          contentPadding: const EdgeInsets.only(top: 10),
        ),
      ),
    );
  }
}
