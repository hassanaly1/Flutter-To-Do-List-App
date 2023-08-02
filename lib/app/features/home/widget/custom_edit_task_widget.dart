import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/colors.dart';

class CustomEditTaskWidget extends StatelessWidget {
  final String imagePath;
  final String taskInfo;
  final String buttonText;
  const CustomEditTaskWidget(
      {super.key,
      required this.imagePath,
      required this.taskInfo,
      required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image(image: AssetImage('assets/images/$imagePath')),
        const SizedBox(width: 10),
        Text(
          '$taskInfo :',
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: textColor,
          ),
        ),
        const Spacer(),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            color: lightGreyBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Text(buttonText,
                style: const TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                )),
          ),
        ),
      ],
    );
  }
}
