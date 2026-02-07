import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/auth_screens/fogot_screen.dart';
import 'package:grand_hotel/Screens/auth_screens/sign_up_screen.dart';
import 'package:grand_hotel/auth_layout.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:grand_hotel/widgets/my_button.dart';
import 'package:grand_hotel/widgets/my_textFeild.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController pswrdController = TextEditingController();

  String? errorText;

  bool isLoading = false;

  void validator() {
    final email = emailController.text.trim();
    final password = pswrdController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        errorText = 'All fields are required';
      });
      return;
    }

    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(email)) {
      setState(() {
        errorText = 'Enter a valid email address';
      });
      return;
    }

    if (password.length < 6) {
      setState(() {
        errorText = "Password must be at least 6 characters";
      });
      return;
    }

    setState(() {
      errorText = null;
    });
  }

  void showErr() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Invalid Input",
          style: TextStyle(
            fontFamily: 'Inter_Medium',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          errorText!,
          style: const TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "OK",
              style: TextStyle(fontFamily: 'Inter_Medium'),
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    try {
      validator();
      if (errorText != null) {
        showErr();
        return;
      }

      setState(() {
        isLoading = true;
      });

      await authService.signIn(
        email: emailController.text,
        password: pswrdController.text,
      );

      if (!mounted) return;

      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const AuthLayout()),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorText = e.message ?? 'Error while login account using firebase.';
        showErr();
      });
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Iconsax.backward),
                ),

                SizedBox(height: 20),

                Center(
                  child: Text(
                    "Let's Sign you in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter_Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(height: 8),

                Center(
                  child: Text(
                    "Lorem ipsum dolor sit amet, consectetur",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter_Medium',
                      fontSize: 11,
                      color: thirdTextColor,
                    ),
                  ),
                ),

                SizedBox(height: 50),

                Text(
                  "Email Address",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                ),

                SizedBox(height: 10),

                MyTextfeild(
                  hintText: "Enter your email address",
                  controller: emailController,
                  obscureText: false,
                ),

                SizedBox(height: 20),

                Text(
                  "Password",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                ),

                SizedBox(height: 10),

                MyTextfeild(
                  hintText: "Enter Your Password",
                  controller: pswrdController,
                  obscureText: true,
                ),

                SizedBox(height: 10),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FogotScreen()),
                    );
                    setState(() {});
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forgot Password',
                      style: TextStyle(
                        color: Color(0xFFF41F52),
                        fontFamily: 'Inter_Medium',
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(text: 'Sign In', onPress: login),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: thirdTextColor,
                        fontFamily: 'Inter_Light',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: kSurfaceColor,
                          fontFamily: 'Inter_Medium',
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 80, height: 2, color: elemntBgColor),
                    SizedBox(width: 5),
                    Text(
                      "Or Sign In with",
                      style: TextStyle(
                        fontFamily: 'Inter_Light',
                        fontSize: 12,
                        color: const Color.fromARGB(255, 120, 120, 120),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(width: 80, height: 2, color: elemntBgColor),
                  ],
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    GestureDetector(
                      onTap: () {
                        // your action
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: elemntBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/google.png',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),

                    SizedBox(width: 20),

                    GestureDetector(
                      onTap: () {
                        // your action
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: elemntBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/apple.png',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),

                    SizedBox(width: 20),

                    GestureDetector(
                      onTap: () {
                        // your action
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: elemntBgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.asset(
                          'assets/facebook.png',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40),

                Center(
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: [
                      Text(
                        "By signing up your agree to our ",
                        style: TextStyle(
                          fontFamily: 'Inter_Medium',
                          fontSize: 13,
                          color: thirdTextColor,
                        ),
                      ),
                      Text(
                        "Terms ",
                        style: TextStyle(
                          fontFamily: 'Inter_Medium',
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "and ",
                        style: TextStyle(
                          fontFamily: 'Inter_Medium',
                          fontSize: 13,
                          color: thirdTextColor,
                        ),
                      ),
                      Text(
                        "Conditions of Use ",
                        style: TextStyle(
                          fontFamily: 'Inter_Medium',
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
