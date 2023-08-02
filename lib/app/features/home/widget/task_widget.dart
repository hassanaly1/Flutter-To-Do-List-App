// ignore_for_file: public_member_api_docs, sort_ructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/features/home/widget/category_box.dart';
import 'package:todo_app/app/features/home/widget/task_priority_box.dart';
import 'package:todo_app/utils/colors.dart';

class TaskWidget extends StatelessWidget {
  final String taskTitle;
  final String taskTime;
  final String taskPriorityNumber;
  final String categoryName;
  final Icon icon;
  final Color backgroundColor;
  final VoidCallback onTap;

  const TaskWidget({
    Key? key,
    required this.taskTitle,
    required this.taskTime,
    required this.categoryName,
    required this.icon,
    required this.backgroundColor,
    required this.taskPriorityNumber,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 85.h,
          width: 340.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: lightGreyBackgroundColor),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Image(
                    image: const AssetImage('assets/images/ellipse.png'),
                    height: 16.h,
                    width: 16.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        taskTitle,
                        style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            taskTime,
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor),
                          ),
                          SizedBox(width: 15.w),
                          CategoryBox(
                              backgroundColor: backgroundColor,
                              text: categoryName,
                              icon: icon),
                          SizedBox(width: 15.w),
                          TaskPriorityBox(
                              backgroundColor: Colors.transparent,
                              text: taskPriorityNumber,
                              icon: Icon(
                                Icons.flag_outlined,
                                color: textColor,
                                size: 15.r,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
