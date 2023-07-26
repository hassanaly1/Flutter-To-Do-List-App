// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:todo_app/app/features/home/widget/task_category_dialog.dart';
import 'package:todo_app/app/features/home/widget/task_priority_dialog.dart';
import 'package:todo_app/utils/colors.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({Key? key}) : super(key: key);

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<CategoryItem> categoryItems = [
    CategoryItem(
      text: 'Grocery',
      backgroundImage: 'assets/images/grocery.png',
    ),
    CategoryItem(
      text: 'Work',
      backgroundImage: 'assets/images/work.png',
    ),
    CategoryItem(
      text: 'Sport',
      backgroundImage: 'assets/images/sport.png',
    ),
    CategoryItem(
      text: 'Design',
      backgroundImage: 'assets/images/design.png',
    ),
    CategoryItem(
      text: 'University',
      backgroundImage: 'assets/images/university.png',
    ),
    CategoryItem(
      text: 'Social',
      backgroundImage: 'assets/images/social.png',
    ),
    CategoryItem(
      text: 'Music',
      backgroundImage: 'assets/images/music.png',
    ),
    CategoryItem(
      text: 'Health',
      backgroundImage: 'assets/images/health.png',
    ),
    CategoryItem(
      text: 'Movie',
      backgroundImage: 'assets/images/movie.png',
    ),
    CategoryItem(
      text: 'Home',
      backgroundImage: 'assets/images/home.png',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeIn,
      ),
    );

    // Start the animation when the dialog is first shown
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      confirmText: 'Choose Time',
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });

      _selectTime(); // Open time picker after selecting the date
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      initialEntryMode: TimePickerEntryMode.inputOnly,
      cancelText: 'Cancel',
      confirmText: 'Save',
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      // Save the date and time in a variable or perform other operations
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget? child) {
        return Opacity(
          opacity: _opacityAnimation.value,
          child: Transform.scale(
            scale: _animationController.value,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              backgroundColor: lightGreyBackgroundColor,
              title: const Text(
                'Add Task',
                style: TextStyle(color: textColor),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TextField(
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      labelText: 'Heading',
                      labelStyle: TextStyle(color: textColor),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0XFF979797), width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const TextField(
                    style: TextStyle(color: textColor),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0XFF979797), width: 1.0),
                      ),
                      labelText: 'Description',
                      labelStyle: TextStyle(color: textColor),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _selectDate();
                        },
                        child: const Image(
                          image: AssetImage('assets/images/timer.png'),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          // if (selectedDate != null) {
                          //   _selectTime();
                          // } else {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content: Text('Please select a date first'),
                          //     ),
                          //   );
                          // }
                        },
                        child: GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return TaskCategoryDialog(
                                    categoryItems: categoryItems);
                              },
                            );
                          },
                          child: const Image(
                            image: AssetImage('assets/images/tag.png'),
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const TaskPriorityDialog();
                            },
                          );
                        },
                        child: const Image(
                          image: AssetImage('assets/images/flag.png'),
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      const Image(
                        image: AssetImage('assets/images/send.png'),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  // const SizedBox(height: 20),
                  // Text(
                  //   'Selected Date: ${selectedDate?.toString() ?? 'None'}',
                  //   style: const TextStyle(color: textColor),
                  // ),
                  // const SizedBox(height: 10),
                  // Text(
                  //   'Selected Time: ${selectedTime?.format(context) ?? 'None'}',
                  //   style: const TextStyle(color: textColor),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
