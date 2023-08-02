import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/home/view/pages/bottom_bar.dart';
import 'package:todo_app/app/features/home/view/pages/home_screen.dart';
import 'package:todo_app/app/features/home/widget/custom_edit_task_widget.dart';
import 'package:todo_app/utils/colors.dart';

class EditTaskScreen extends StatelessWidget {
  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Image(
                      image: AssetImage('assets/images/add.png'),
                    ),
                  ),
                  const Image(
                    image: AssetImage('assets/images/repeat.png'),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage('assets/images/ellipse.png'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Do Math Homework',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Do chapter 2 to 5 for next week',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Image(
                    image: AssetImage('assets/images/edit.png'),
                  )
                ],
              ),
              const SizedBox(height: 25),
              const CustomEditTaskWidget(
                  imagePath: 'timer.png',
                  taskInfo: 'Task Time',
                  buttonText: 'Today at 16:45 pm'),
              const SizedBox(height: 25),
              const CustomEditTaskWidget(
                  imagePath: 'tag.png',
                  taskInfo: 'Task Company',
                  buttonText: 'University'),
              const SizedBox(height: 25),
              const CustomEditTaskWidget(
                  imagePath: 'flag.png',
                  taskInfo: 'Task Prioriry',
                  buttonText: 'Default'),
              const SizedBox(height: 25),
              const CustomEditTaskWidget(
                  imagePath: 'hierarchy.png',
                  taskInfo: 'Sub-Task',
                  buttonText: 'Add Sub Task'),
              const SizedBox(height: 25),
              Row(
                children: [
                  const Image(image: AssetImage('assets/images/trash.png')),
                  const SizedBox(width: 10),
                  Text(
                    'Delete Task',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const BottomBar(),
                        ));
                  },
                  child: Text(
                    'Edit Category',
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
