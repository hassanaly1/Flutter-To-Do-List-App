import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/app/features/auth/view/pages/onboarding_screens/reusable_onboarding_screen.dart';

class BoardingScreen extends StatefulWidget {
  const BoardingScreen({super.key});

  @override
  State<BoardingScreen> createState() => _BoardingScreenState();
}

class _BoardingScreenState extends State<BoardingScreen> {
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              ReUableOnBoardingScreen(
                  mainText: 'Manage your tasks',
                  subText:
                      'You can easily manage all of your daily tasks in DoMe for free',
                  buttonText: 'NEXT'),
              ReUableOnBoardingScreen(
                  mainText: 'Create daily routine',
                  subText:
                      'In Uptodo  you can create your personalized routine to stay productive',
                  buttonText: 'NEXT'),
              ReUableOnBoardingScreen(
                  mainText: 'Organaize your tasks',
                  subText:
                      'You can organize your daily tasks by adding your tasks into separate categories',
                  buttonText: 'GET STARTED'),

              // OnBoardingScreen1(),
              // OnBoardingScreen2(),
              // OnBoardingScreen3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.05),
            child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.white,
                    strokeWidth: 1,
                    dotHeight: 5)),
          )
        ],
      ),
    );
  }
}
