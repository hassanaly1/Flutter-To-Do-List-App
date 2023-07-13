// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/auth/view/pages/login/login_screen.dart';
import 'package:todo_app/app/features/auth/widget/custom_text_field.dart';
import 'package:todo_app/utils/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Register',
                style: GoogleFonts.lato(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                  name: 'Username', hintText: 'Enter your Username'),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                name: 'Password',
                hintText: '************',
                obsecureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextField(
                name: 'Confirm Password',
                hintText: '************',
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
                  onPressed: () {},
                  child: Text(
                    'Register',
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
                height: 50,
              ),

              //Dont have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
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
                              builder: (context) => const LoginScreen(),
                            ));
                      },
                      child: Text(
                        'Login',
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
