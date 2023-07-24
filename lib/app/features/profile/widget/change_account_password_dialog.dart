import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class ChangeAccountPasswordDialog extends StatefulWidget {
  const ChangeAccountPasswordDialog({super.key});

  @override
  State<ChangeAccountPasswordDialog> createState() =>
      _ChangeAccountPasswordDialogState();
}

class _ChangeAccountPasswordDialogState
    extends State<ChangeAccountPasswordDialog> {
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightGreyBackgroundColor,
      title: Column(
        children: [
          Text(
            'Change Account Password',
            textAlign: TextAlign.center,
            style: TextStyle(color: textColor, fontSize: 16.sp),
          ),
          const Divider(
            color: dividerColor,
            thickness: 2,
          ),
          Text(
            'Enter Password',
            textAlign: TextAlign.start,
            style: TextStyle(color: textColor, fontSize: 14.sp),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      content: Column(
        children: [
          TextField(
            obscureText: true,
            style: const TextStyle(color: textColor),
            // controller: _textFieldController,
            decoration: InputDecoration(
              hintText: 'Enter old password',
              hintStyle: const TextStyle(color: textColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: textColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: textColor),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Confirm Password',
            textAlign: TextAlign.start,
            style: TextStyle(color: textColor, fontSize: 14.sp),
          ),
          const SizedBox(height: 16),
          TextField(
            obscureText: true,
            controller: _confirmPasswordController,
            style: const TextStyle(color: textColor),
            decoration: InputDecoration(
              hintText: 'Enter new password',
              hintStyle: const TextStyle(color: textColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: textColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: const BorderSide(color: textColor),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text(
            'Cancel',
            style: TextStyle(color: buttonColor),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        SizedBox(
          height: 48,
          width: 150,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              backgroundColor: buttonColor,
            ),
            onPressed: () {
              String newPassword = _confirmPasswordController.text;
              // Perform the edit operation here
              Navigator.of(context).pop();
            },
            child: Text(
              'Edit',
              maxLines: 1,
              style: GoogleFonts.lato(color: textColor, fontSize: 18.sp),
            ),
          ),
        ),
      ],
    );
  }
}
