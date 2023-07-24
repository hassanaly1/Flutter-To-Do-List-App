import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/colors.dart';

class TaskPriorityBox extends StatelessWidget {
  final Color backgroundColor;
  final String text;
  final Icon icon;
  const TaskPriorityBox(
      {super.key,
      required this.backgroundColor,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40.w,
      height: 32.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: backgroundColor,
          border: Border.all(color: const Color(0XFF8687E7))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          SizedBox(width: 5.w),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}
