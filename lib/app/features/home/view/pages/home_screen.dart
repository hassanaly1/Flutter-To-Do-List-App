import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              child: Row(
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
            ),
            //Image and Text
            const Center(
              child: Image(
                width: 213,
                height: 277,
                image: AssetImage('assets/images/home_screen_image.png'),
              ),
            ),
            //Dots Indicator

            //Headings
            Column(
              children: [
                Text(
                  'What do you want to do today?',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: textColor,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Tap + to add your tasks',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
