import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class CountdownTimerPage extends StatefulWidget {
  const CountdownTimerPage({super.key});

  @override
  _CountdownTimerPageState createState() => _CountdownTimerPageState();
}

class _CountdownTimerPageState extends State<CountdownTimerPage> {
  int _durationInSeconds = 0;
  bool _isTimerStarted = false;

  void _startTimer() {
    setState(() {
      _isTimerStarted = true;
    });
  }

  void _resetTimer() {
    setState(() {
      _isTimerStarted = false;
      _durationInSeconds = 0;
    });
  }

  String _getFormattedTime(int duration) {
    int hours = duration ~/ 3600;
    int minutes = (duration % 3600) ~/ 60;
    int seconds = duration % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  void _showDurationInput() {
    showDialog(
      context: context,
      builder: (context) {
        int hours = 0;
        int minutes = 0;

        return AlertDialog(
          title: const Text('Set Timer Duration'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Hours'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  hours = int.tryParse(value) ?? 0;
                },
              ),
              const Text('Minutes'),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  minutes = int.tryParse(value) ?? 0;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                int totalSeconds = (hours * 3600) + (minutes * 60);
                if (totalSeconds > 0) {
                  setState(() {
                    _durationInSeconds = totalSeconds;
                    _startTimer();
                  });
                }
                Navigator.pop(context);
              },
              child: const Text('Start Timer'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Visibility(
            visible: _isTimerStarted,
            child: Column(
              children: [
                CircularCountDownTimer(
                  duration: _durationInSeconds,
                  controller: CountDownController(),
                  width: 200.w,
                  height: 200.h,
                  ringColor: Colors.grey,
                  fillColor: buttonColor,
                  backgroundColor: backgroundColor,
                  strokeWidth: 15.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textFormat: CountdownTextFormat.HH_MM_SS,
                  isReverse: true,
                  onComplete: () {
                    _resetTimer();
                  },
                ),
                const SizedBox(height: 20),
                Text(
                  'While your focus mode is on, all of your notifications will be off',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  width: 177,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: buttonColor,
                    ),
                    onPressed: () {
                      _resetTimer();
                    },
                    child: Text(
                      'Stop Focusing',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: !_isTimerStarted,
            child: Column(
              children: [
                CircularCountDownTimer(
                  duration: _durationInSeconds,
                  controller: CountDownController(),
                  width: 200.w,
                  height: 200.h,
                  ringColor: Colors.grey,
                  fillColor: buttonColor,
                  backgroundColor: backgroundColor,
                  strokeWidth: 15.0,
                  strokeCap: StrokeCap.round,
                  textStyle: const TextStyle(
                    fontSize: 25.0,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textFormat: CountdownTextFormat.HH_MM_SS,
                  isReverse: true,
                ),
                const SizedBox(height: 20),
                Text(
                  'While your focus mode is on, all of your notifications will be off',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: textColor,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  width: 177,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: buttonColor,
                    ),
                    onPressed: () {
                      _showDurationInput();
                    },
                    child: Text(
                      'Start Focusing',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
