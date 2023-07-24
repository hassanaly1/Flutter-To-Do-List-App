import 'package:flutter/material.dart';
import 'package:todo_app/utils/colors.dart';

class ChangeAccountImageModal extends StatelessWidget {
  const ChangeAccountImageModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Container(
        color: lightGreyBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Change Account Image',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                  textAlign: TextAlign.center,
                ),
              ),
              const Divider(
                color: dividerColor,
                thickness: 2,
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Take Picture',
                    style: TextStyle(color: textColor)),
                onTap: () {
                  // Handle the "Take Picture" option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Import from Gallery',
                    style: TextStyle(color: textColor)),
                onTap: () {
                  // Handle the "Import from Gallery" option
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.drive_folder_upload),
                title: const Text('Import from Google Drive',
                    style: TextStyle(color: textColor)),
                onTap: () {
                  // Handle the "Import from Google Drive" option
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
