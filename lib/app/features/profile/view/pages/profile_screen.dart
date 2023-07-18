import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/app/features/profile/widget/resuabale_profile_tabs.dart';
import 'package:todo_app/utils/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
              child: Column(
                children: [
                  //Text and Image
                  Column(
                    children: [
                      Text('Profile',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.sp)),
                      SizedBox(height: 15.h),
                      CircleAvatar(backgroundColor: Colors.red, radius: 45.r),
                      SizedBox(height: 15.h),
                      Text(
                        'Martha Hays',
                        style: TextStyle(color: Colors.white, fontSize: 20.sp),
                      ),
                      SizedBox(height: 15.h)
                    ],
                  ),
                  //Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 154.w,
                        height: 58.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightGreyBackgroundColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text('10 tasks left',
                              style:
                                  TextStyle(color: textColor, fontSize: 16.sp)),
                        ),
                      ),
                      SizedBox(
                          width: 10.w), // Add some spacing between the buttons
                      SizedBox(
                        width: 154.w,
                        height: 58.h,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: lightGreyBackgroundColor,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text(
                            '5 tasks done',
                            style: TextStyle(color: textColor, fontSize: 16.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Settings',
                            style: TextStyle(color: textColor)),
                        SizedBox(height: 10.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/setting.png',
                            text: 'App Settings'),
                        SizedBox(height: 25.h),
                        const Text('Account',
                            style: TextStyle(color: textColor)),
                        SizedBox(height: 10.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/account-name.png',
                            text: 'Change Account Name'),
                        SizedBox(height: 25.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/account-password.png',
                            text: 'Change Account Password'),
                        SizedBox(height: 25.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/account-image.png',
                            text: 'Change Account Image'),
                        SizedBox(height: 25.h),
                        const Text('Uptodo',
                            style: TextStyle(color: textColor)),
                        SizedBox(height: 10.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/about-us.png',
                            text: 'About Us'),
                        SizedBox(height: 25.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/faq.png', text: 'FAQ'),
                        SizedBox(height: 25.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/help.png',
                            text: 'Help & Feedback'),
                        SizedBox(height: 25.h),
                        const ReUsableProfileTabs(
                            imagePath: 'assets/images/support-us.png',
                            text: 'Support Us'),
                        SizedBox(height: 25.h),
                        Row(
                          children: [
                            const Image(
                              image: AssetImage('assets/images/logout.png'),
                            ),
                            SizedBox(width: 5.w),
                            Text('Logout',
                                style: TextStyle(
                                    color: Colors.red, fontSize: 16.sp))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
