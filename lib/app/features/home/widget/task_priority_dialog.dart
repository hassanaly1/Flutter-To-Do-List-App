import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/utils/colors.dart';

class TaskPriorityDialog extends StatefulWidget {
  const TaskPriorityDialog({super.key});

  @override
  _TaskPriorityDialogState createState() => _TaskPriorityDialogState();
}

class _TaskPriorityDialogState extends State<TaskPriorityDialog> {
  int? selectedBox;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightGreyBackgroundColor,
      title: const Text('Task Priority',
          textAlign: TextAlign.center,
          style: TextStyle(color: textColor, fontSize: 16)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(),
          SizedBox(height: 10.h),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: List.generate(10, (index) {
              final isSelected = selectedBox == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedBox = index;
                  });
                },
                child: Container(
                  width: 50,
                  height: 55,
                  color: isSelected ? Colors.blue : boxColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        image: AssetImage('assets/images/flag.png'),
                        color: Colors.white,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        (index + 1).toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Perform action with the selected box value
            print('Selected Box: ${selectedBox! + 1}');
            Navigator.of(context).pop();
          },
          child: const Text('OK', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
