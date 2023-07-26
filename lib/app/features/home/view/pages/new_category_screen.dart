import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/utils/colors.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NewCategoryScreen(),
    );
  }
}

class NewCategoryScreen extends StatefulWidget {
  const NewCategoryScreen({super.key});

  @override
  _NewCategoryScreenState createState() => _NewCategoryScreenState();
}

class _NewCategoryScreenState extends State<NewCategoryScreen> {
  final TextEditingController _categoryNameController = TextEditingController();
  String? _selectedIconPath;
  final List<Color> _colorOptions = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.blueGrey,
    Colors.greenAccent,
    Colors.indigo,
    Colors.deepOrangeAccent,
    Colors.teal
  ];
  Color _selectedColor = Colors.red;

  void _pickImage() async {
    final XFile? pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedIconPath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Choose new category',
                style: GoogleFonts.lato(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Category Name:',
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 48.h,
                child: TextField(
                  style: const TextStyle(color: textColor),
                  controller: _categoryNameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter category name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Category Icon:',
                style: GoogleFonts.lato(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 10),
              // Show selected icon in a box instead of the button
              _selectedIconPath != null
                  ? Container(
                      height: 100.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Image.file(File(_selectedIconPath!)),
                    )
                  : SizedBox(
                      height: 37.h,
                      //width: 154.w,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: lightGreyBackgroundColor,
                        ),
                        onPressed: () {
                          _pickImage();
                        },
                        child: Text(
                          'Choose icon from library',
                          maxLines: 1,
                          style: GoogleFonts.lato(
                              color: textColor, fontSize: 12.sp),
                        ),
                      ),
                    ),
              const SizedBox(height: 20),
              Text(
                'Category Color:',
                style: GoogleFonts.lato(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: textColor),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _colorOptions.map((color) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedColor = color;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: CircleAvatar(
                          backgroundColor: color,
                          radius: 22.r,
                          child: _selectedColor == color
                              ? const Icon(Icons.check, color: Colors.white)
                              : null,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // const Spacer(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.lato(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w700,
                              color: smallButtonColor,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 48.h,
                          width: 160.w,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: primaryButtonColor,
                            ),
                            onPressed: () {},
                            child: Text(
                              'Create Category',
                              maxLines: 1,
                              style: GoogleFonts.lato(
                                  color: textColor, fontSize: 12.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // ElevatedButton(
              //   onPressed: () {
              //     // Save the category with name, icon, and selected color
              //     String categoryName = _categoryNameController.text;
              //     // You can do something with the selectedIconPath and _selectedColor
              //     // Save it to your data store or perform any other action as needed.
              //     // For demonstration purposes, we are just printing the values here.
              //     print('Category Name: $categoryName');
              //     print('Selected Icon Path: $_selectedIconPath');
              //     print('Selected Color: $_selectedColor');
              //   },
              //   child: const Text('Save'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
