import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/home/view/pages/new_category_screen.dart';
import 'package:todo_app/utils/colors.dart';

class TaskCategoryDialog extends StatefulWidget {
  final List<CategoryItem> categoryItems;

  const TaskCategoryDialog({Key? key, required this.categoryItems})
      : super(key: key);

  @override
  _TaskCategoryDialogState createState() => _TaskCategoryDialogState();
}

class _TaskCategoryDialogState extends State<TaskCategoryDialog> {
  int? selectedBox;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: lightGreyBackgroundColor,
      title: const Text('Choose Category',
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
            children: List.generate(widget.categoryItems.length, (index) {
              final item = widget.categoryItems[index];
              //  final isSelected = selectedBox == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedBox = index;
                  });
                  if (selectedBox != null) {
                    final selectedCategoryItem =
                        widget.categoryItems[selectedBox!];
                    debugPrint('Selected Box: ${selectedCategoryItem.text}');
                  }
                  Navigator.of(context).pop();
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Container(
                        width: 64.w,
                        height: 64.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: AssetImage(item.backgroundImage),
                            fit: BoxFit.cover,
                          ),
                          // color: isSelected ? Colors.blue : boxColor,
                        ),
                      ),
                      Text(
                        item.text,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                backgroundColor: buttonColor,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const NewCategoryScreen(),
                    ));
              },
              child: Text(
                'Add Category',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final String text;
  final String backgroundImage;

  CategoryItem({required this.text, required this.backgroundImage});
}
