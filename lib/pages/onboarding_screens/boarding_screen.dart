import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todo_app/pages/onboarding_screens/onboarding_screen1.dart';
import 'package:todo_app/pages/onboarding_screens/onboarding_screen2.dart';
import 'package:todo_app/pages/onboarding_screens/onboarding_screen3.dart';

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
            children: const [
              OnBoardingScreen1(),
              OnBoardingScreen2(),
              OnBoardingScreen3(),
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
