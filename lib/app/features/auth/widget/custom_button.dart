import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final bool loading;
  final VoidCallback onTap;
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.loading,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: buttonColor,
          ),
          onPressed: onTap,
          child: Center(
            child: loading
                ? const CircularProgressIndicator()
                : Text(
                    buttonText,
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
          )),
    );
  }
}
