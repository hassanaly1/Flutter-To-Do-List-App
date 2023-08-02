import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/home/view/pages/edit_task_screen.dart';
import 'package:todo_app/app/features/home/widget/task_widget.dart';
import 'package:todo_app/utils/colors.dart';

class ListToggleWidget extends StatefulWidget {
  const ListToggleWidget({Key? key}) : super(key: key);

  @override
  _ListToggleWidgetState createState() => _ListToggleWidgetState();
}

class _ListToggleWidgetState extends State<ListToggleWidget> {
  bool _showTodayList = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 326,
              height: 80,
              decoration: const BoxDecoration(color: Color(0XFF4c4c4c)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 16),
                  Container(
                    height: 45,
                    width: 137,
                    decoration: BoxDecoration(
                      border: _showTodayList
                          ? null // No border if _showTodayList is true
                          : Border.all(
                              color: textColor, // Border color
                              // Border width
                            ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor: _showTodayList
                            ? buttonColor
                            : const Color(0XFF4c4c4c),
                      ),
                      onPressed: () {
                        setState(() {
                          _showTodayList = true;
                        });
                      },
                      child: Text(
                        'Today',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 137,
                    decoration: BoxDecoration(
                      border: _showTodayList
                          ? Border.all(
                              color: textColor, // Border color
                              // Border width
                            )
                          : null,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor: _showTodayList
                            ? const Color(0XFF4c4c4c)
                            : buttonColor,
                      ),
                      onPressed: () {
                        setState(() {
                          _showTodayList = false;
                        });
                      },
                      child: Text(
                        'Completed',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              children: [
                Visibility(
                  visible: _showTodayList,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3, // Show the widget 3 times for Today list
                    itemBuilder: (context, index) => TaskWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditTaskScreen(),
                          ),
                        );
                      },
                      taskTitle: 'Do Math Homework',
                      taskTime: 'Today At 18:20',
                      categoryName: 'Home',
                      backgroundColor: categoryRedColor,
                      icon: const Icon(
                        Icons.home_outlined,
                        color: Color.fromARGB(255, 124, 12, 12),
                        size: 15,
                      ),
                      taskPriorityNumber: '2',
                    ),
                  ),
                ),
                Visibility(
                  visible: !_showTodayList,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 1, // Show the widget 1 time for Completed list
                    itemBuilder: (context, index) => TaskWidget(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditTaskScreen(),
                          ),
                        );
                      },
                      taskTitle: 'Completed Task 1',
                      taskTime: 'Completed',
                      categoryName: 'Work',
                      backgroundColor: categoryBlueColor,
                      icon: const Icon(
                        Icons.work_outline,
                        color: Color.fromARGB(255, 12, 12, 124),
                        size: 15,
                      ),
                      taskPriorityNumber: '1',
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
