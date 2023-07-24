import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryBox extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Icon icon;
  const CategoryBox(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 32.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r), color: backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 5.w),
          Text(
            text,
            style: TextStyle(fontSize: 12.sp, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
