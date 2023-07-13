// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/auth/view/pages/register/register_screen.dart';
import 'package:todo_app/app/features/auth/widget/custom_text_field.dart';
import 'package:todo_app/app/features/home/view/pages/bottom_bar.dart';
import 'package:todo_app/utils/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: IconButton(
          icon: const Padding(
            padding: EdgeInsets.all(25.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: textColor,
            ),
          ), // Set the desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Other AppBar properties...
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: GoogleFonts.lato(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 40),
              const CustomTextField(
                  name: 'Username', hintText: 'Enter your Username'),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                name: 'Password',
                hintText: 'Enter your Password',
                obsecureText: true,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    ),
                    backgroundColor: buttonColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const BottomBar(),
                        ));
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //divider
              const Row(children: [
                Expanded(child: Divider()),
                Text(
                  " or ",
                  style: TextStyle(color: lightGreyColor),
                ),
                Expanded(child: Divider()),
              ]),
              const SizedBox(
                height: 30,
              ),
              //login with google
              SizedBox(
                height: 48,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                        side: const BorderSide(color: buttonColor, width: 1)),
                    backgroundColor: backgroundColor,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/google_logo.png', width: 20.0),
                      const SizedBox(width: 10.0),
                      Text(
                        'Login with Google',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          color: textColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),

              //Dont have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dont have an account?',
                    style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: lightGreyColor,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const RegistrationScreen(),
                            ));
                      },
                      child: Text(
                        'Register',
                        style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: textColor,
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
