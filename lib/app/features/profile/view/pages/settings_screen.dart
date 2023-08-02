import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/profile/widget/change_account_image_modal.dart';
import 'package:todo_app/app/features/profile/widget/change_account_name_dialog.dart';
import 'package:todo_app/app/features/profile/widget/change_account_password_dialog.dart';
import 'package:todo_app/app/features/profile/widget/resuabale_profile_tabs.dart';
import 'package:todo_app/utils/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Settings',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: textColor,
          ), // Set the desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Other AppBar properties...
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Settings', style: TextStyle(color: textColor)),
            SizedBox(height: 10.h),
            ReUsableProfileTabs(
                imagePath: 'assets/images/brush.png',
                text: 'Change app color',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChangeAccountNameDialog();
                    },
                  );
                }),
            SizedBox(height: 25.h),
            ReUsableProfileTabs(
                imagePath: 'assets/images/outline-text.png',
                text: 'Change app typography',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ChangeAccountPasswordDialog();
                    },
                  );
                }),
            SizedBox(height: 25.h),
            ReUsableProfileTabs(
                imagePath: 'assets/images/language-square.png',
                text: 'Change app language',
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: lightGreyBackgroundColor,
                    context: context,
                    builder: (BuildContext context) {
                      return const ChangeAccountImageModal();
                    },
                  );
                }),
            SizedBox(height: 25.h),
            const Text('Import', style: TextStyle(color: textColor)),
            SizedBox(height: 10.h),
            ReUsableProfileTabs(
                imagePath: 'assets/images/outline-import.png',
                text: 'Import from Google Calender',
                onTap: () {}),
          ],
        ),
      ),
    );
  }
}
