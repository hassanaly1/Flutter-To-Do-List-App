// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app/features/auth/provider/auth_provider.dart';
import 'package:todo_app/app/features/auth/view/pages/login/login_screen.dart';
import 'package:todo_app/app/features/auth/widget/custom_button.dart';
import 'package:todo_app/app/features/auth/widget/custom_text_field.dart';
import 'package:todo_app/utils/colors.dart';
import 'package:todo_app/utils/utils.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool loading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void createUser() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    if (password == confirmPassword) {
      setState(() {
        loading = true; //show CirclularProgressIndicator
      });
      _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        // handle success
        // do something after the sign-in operation completes successfully
        // you can use the 'value' parameter to access the user data

        debugPrint('Account Created');
        Utils()
            .toastMessage('Account Created! Login with the same credentials.');
        setState(() {
          loading = false;
        });
        Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => const LoginScreen(),
            ));
      }).onError((error, stackTrace) {
        // handle error
        // do something if the sign-in operation fails
        // you can use the 'error' parameter to access the error details
        Utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    } else {
      Utils().toastMessage("Passwords didn't Match");
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
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
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        name: 'Username',
                        hintText: 'Enter your Username',
                        controller: emailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'Password',
                        hintText: '************',
                        obsecureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        name: 'Confirm Password',
                        hintText: '************',
                        obsecureText: true,
                        controller: confirmPasswordController,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 50,
              ),
              CustomButton(
                buttonText: 'Register',
                loading: authProvider.loading,
                onTap: () {
                  String email = emailController.text.trim();
                  String password = passwordController.text.trim();
                  String confirmPassword =
                      confirmPasswordController.text.trim();
                  if (_formKey.currentState!.validate()) {
                    if (password == confirmPassword) {
                      authProvider
                          .signUpWithEmailAndPassword(email, password)
                          .then((value) {
                        debugPrint('Account Created');
                        Utils().toastMessage(
                            'Account Created! Login with the same credentials.');
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const LoginScreen(),
                            ));
                      }).onError((error, stackTrace) {
                        Utils().toastMessage(error.toString());
                      });
                    } else {
                      Utils().toastMessage("Passwords didn't Match");
                    }
                  }
                },
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // createUser();
                    }
                  },
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
