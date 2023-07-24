import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class ChangeAccountNameDialog extends StatefulWidget {
  const ChangeAccountNameDialog({super.key});

  @override
  State<ChangeAccountNameDialog> createState() =>
      _ChangeAccountNameDialogState();
}

class _ChangeAccountNameDialogState extends State<ChangeAccountNameDialog> {
  final TextEditingController _textFieldController = TextEditingController();
  String newName = '';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 327,
      width: 187,
      child: AlertDialog(
        backgroundColor: lightGreyBackgroundColor,
        title: Column(
          children: [
            Text(
              'Change Account Name',
              textAlign: TextAlign.center,
              style: TextStyle(color: textColor, fontSize: 16.sp),
            ),
            const Divider(
              color: dividerColor,
              thickness: 2,
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        content: SizedBox(
          width: double.infinity,
          child: TextField(
            style: const TextStyle(color: textColor),
            controller: _textFieldController,
            decoration: InputDecoration(
              hintText: 'Enter new name',
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
            height: 48.h,
            width: 150.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                backgroundColor: buttonColor,
              ),
              onPressed: () {},
              child: Text(
                'Edit',
                maxLines: 1,
                style: GoogleFonts.lato(color: textColor, fontSize: 18.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
