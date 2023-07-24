import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class ApplicationDetailWidget extends StatelessWidget {
  final String applicationName;
  final String applicationDescription;
  final String iconName;
  const ApplicationDetailWidget({
    super.key,
    required this.applicationName,
    required this.applicationDescription,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          width: 327.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: lightGreyBackgroundColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(
                  'assets/images/$iconName.png',
                ),
                height: 25.h,
                width: 25.w,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(applicationName,
                      style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: textColor)),
                  Text(applicationDescription,
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ))
                ],
              ),
              // const SizedBox(width: 20),
              const VerticalDivider(color: textColor, thickness: 1),
              const SizedBox(width: 5),
              const Image(image: AssetImage('assets/images/info-circle.png')),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}
