import 'package:flutter/material.dart';
import 'package:todo_app/app/features/home/widget/task_widget.dart';
import 'package:todo_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image(
                      width: 42,
                      height: 42,
                      image: AssetImage('assets/images/drawer_image.png')),
                  Text(
                    'Index',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                  )
                ],
              ),
              const SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: searchBarBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const TextField(
                  style: TextStyle(color: textColor),
                  decoration: InputDecoration(
                    prefixIcon: Image(
                        image: AssetImage('assets/images/search-normal.png')),
                    hintText: 'Search for your task',
                    hintStyle: TextStyle(color: hintTextColor),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: textColor)),
                  ),
                ),
              ),
              //
              const SizedBox(height: 15),
              Container(
                height: 40,
                width: 70,
                decoration: BoxDecoration(
                  color: lightGreyBackgroundColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Today',
                        style: TextStyle(color: textColor, fontSize: 12)),
                    Image(image: AssetImage('assets/images/arrow-down.png')),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              //List of Tasks
              const TaskWidget(
                taskTitle: 'Do Math Homework',
                taskTime: 'Today At 16:45',
                categoryName: 'University',
                backgroundColor: categoryBlueColor,
                icon: Icon(
                  Icons.school_outlined,
                  color: Color.fromARGB(255, 12, 74, 126),
                  size: 15,
                ),
                taskPriorityNumber: '1',
              ),
              const TaskWidget(
                taskTitle: 'Do Math Homework',
                taskTime: 'Today At 16:45',
                categoryName: 'Home',
                backgroundColor: categoryRedColor,
                icon: Icon(
                  Icons.home_outlined,
                  color: Color.fromARGB(255, 124, 12, 12),
                  size: 15,
                ),
                taskPriorityNumber: '2',
              ),
              const TaskWidget(
                taskTitle: 'Do Math Homework',
                taskTime: 'Today At 16:45',
                categoryName: 'Work',
                backgroundColor: categoryYellowColor,
                icon: Icon(
                  Icons.school_outlined,
                  color: Color.fromARGB(255, 126, 105, 15),
                  size: 15,
                ),
                taskPriorityNumber: '3',
              )
            ],
          ),
        ),
      ),
    );
  }
}

   //Image and Text
            // const Center(
            //   child: Image(
            //     width: 213,
            //     height: 277,
            //     image: AssetImage('assets/images/home_screen_image.png'),
            //   ),
            // ),
            // //Dots Indicator

            // //Headings
            // Column(
            //   children: [
            //     Text(
            //       'What do you want to do today?',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.lato(
            //         fontSize: 20,
            //         fontWeight: FontWeight.w700,
            //         color: textColor,
            //       ),
            //     ),
            //     const SizedBox(
            //       height: 15,
            //     ),
            //     Text(
            //       'Tap + to add your tasks',
            //       textAlign: TextAlign.center,
            //       style: GoogleFonts.lato(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w400,
            //         color: textColor,
            //       ),
            //     )
            //   ],
            // ),