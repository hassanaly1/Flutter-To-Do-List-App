import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/focus/widgets/applications_detail_widget.dart';
import 'package:todo_app/app/features/focus/widgets/countdown_timer.dart';
import 'package:todo_app/utils/colors.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  State<FocusScreen> createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Focus Mode',
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              const CountdownTimerPage(),
              const SizedBox(height: 20),
              ClipRect(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overview',
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: textColor,
                      ),
                    ),
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
                          Text('This Week',
                              style: TextStyle(color: textColor, fontSize: 10)),
                          Image(
                              image:
                                  AssetImage('assets/images/arrow-down.png')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Applications',
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Column(
                    children: [
                      ApplicationDetailWidget(
                          applicationName: 'Instagram',
                          applicationDescription:
                              'You spent 4h on this app today',
                          iconName: 'instagram'),
                      ApplicationDetailWidget(
                          applicationName: 'Twitter',
                          applicationDescription:
                              'You spent 3h on this app today',
                          iconName: 'twitter'),
                      ApplicationDetailWidget(
                          applicationName: 'Facebook',
                          applicationDescription:
                              'You spent 1h on this app today',
                          iconName: 'facebook'),
                      ApplicationDetailWidget(
                          applicationName: 'Telegram',
                          applicationDescription:
                              'You spent 1h on this app today',
                          iconName: 'telegram'),
                      ApplicationDetailWidget(
                          applicationName: 'Gmail',
                          applicationDescription:
                              'You spent 1h on this app today',
                          iconName: 'gmail')
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
