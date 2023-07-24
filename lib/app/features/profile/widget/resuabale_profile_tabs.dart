import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class ReUsableProfileTabs extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;
  const ReUsableProfileTabs(
      {super.key,
      required this.text,
      required this.imagePath,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 5),
          Text(
            text,
            style: GoogleFonts.lato(
                fontSize: 16, fontWeight: FontWeight.w400, color: textColor),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 16, color: textColor)
        ],
      ),
    );
  }
}
