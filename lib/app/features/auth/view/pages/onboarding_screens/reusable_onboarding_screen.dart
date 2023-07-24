// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/app/features/auth/view/pages/onboarding_screens/start_screen.dart';

class ReUableOnBoardingScreen extends StatelessWidget {
  final String mainText;
  final String subText;
  final String buttonText;
  final String imageName;
  ReUableOnBoardingScreen({
    super.key,
    required this.mainText,
    required this.subText,
    required this.buttonText,
    required this.imageName,
  });

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 25.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const StartScreen(),
                      ));
                },
                child: Text(
                  "SKIP",
                  style: GoogleFonts.lato(
                    fontSize: 24.sp,
                    color: smallButtonColor,
                  ),
                ),
              ),
            ),
            //Image
            Center(
              child: Image(
                width: 213.w,
                height: 277.h,
                image: AssetImage('assets/images/$imageName.png'),
              ),
            ),
            //Dots Indicator

            //Headings
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 50.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.h,
                  ),
                  Text(
                    mainText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                    subText,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "BACK",
                      style: GoogleFonts.lato(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: smallButtonColor,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
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
                        buttonText,
                        maxLines: 1,
                        style:
                            GoogleFonts.lato(color: textColor, fontSize: 18.sp),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
