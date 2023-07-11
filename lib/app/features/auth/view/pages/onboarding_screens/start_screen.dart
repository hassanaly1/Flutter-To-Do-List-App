import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/features/auth/view/pages/login/login_screen.dart';
import 'package:todo_app/utils/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
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
              color: Colors.white,
            ),
          ), // Set the desired icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // Other AppBar properties...
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  'Welcome to UpTodo',
                  style: GoogleFonts.lato(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xffffffffde),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Please login to your account or create new account to continue',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffffffffde),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          //Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      backgroundColor: const Color(0XFF8875FF),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    child: Text(
                      'LOGIN',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffffde),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: const BorderSide(
                              color: Color(0XFF8875FF), width: 2)),
                      backgroundColor: backgroundColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'CREATE ACCOUNT',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xffffffffde),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
