// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String name;
  final String hintText;
  final bool obsecureText;
  final TextEditingController controller;

  const CustomTextField(
      {super.key,
      required this.name,
      required this.hintText,
      this.obsecureText = false,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: const Color(0xffffffffde)),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(color: Color(0xffffffffde)),
          obscureText: obsecureText,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Enter your $name';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0XFF535353)),
            filled: true,
            fillColor: const Color(0XFF1D1D1D),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0XFF979797), width: 1.0),
            ),
          ),
        ),
      ],
    );
  }
}
