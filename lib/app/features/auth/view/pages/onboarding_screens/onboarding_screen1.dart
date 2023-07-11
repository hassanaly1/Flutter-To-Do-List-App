import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/app/features/auth/view/pages/onboarding_screens/onboarding_screen2.dart';
import 'package:todo_app/app/features/auth/view/pages/onboarding_screens/start_screen.dart';

class OnBoardingScreen1 extends StatefulWidget {
  const OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    // final pages = [
    //   const OnBoardingScreen1(),
    //   const OnBoardingScreen2(),
    //   const OnBoardingScreen3(),
    // ];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 25),
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
                    fontSize: 24,
                    color: const Color.fromARGB(255, 148, 147, 147),
                  ),
                ),
              ),
            ),
            //Image
            const Center(
              child: Image(
                width: 213,
                height: 277,
                image: AssetImage('assets/images/image1.png'),
              ),
            ),
            //Dots Indicator

            //Headings
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Manage your tasks',
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xffffffffde),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'You can easily manage all of your daily tasks in DoMe for free',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffffffffde),
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
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 148, 147, 147),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    height: 48,
                    width: 90,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                        ),
                        backgroundColor: const Color(0XFF8875FF),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const OnBoardingScreen2(),
                            ));
                      },
                      child: Text(
                        'NEXT',
                        style: GoogleFonts.lato(
                            color: const Color(0xffffffffde), fontSize: 18),
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
