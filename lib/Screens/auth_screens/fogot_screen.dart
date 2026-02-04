import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:grand_hotel/widgets/my_button.dart';
import 'package:grand_hotel/widgets/my_textFeild.dart';
import 'package:grand_hotel/widgets/show_success_dailog.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class FogotScreen extends StatefulWidget {
  const FogotScreen({super.key});

  @override
  State<FogotScreen> createState() => _FogotScreenState();
}

class _FogotScreenState extends State<FogotScreen> {
  TextEditingController emailController = TextEditingController();

  String? errorText;

  bool isLoading = false;

  void validator() {
    final email = emailController.text.trim();

    if (email.isEmpty) {
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

  void reset() async {
    try {
      validator();
      if (errorText != null) {
        showErr();
        return;
      }

      setState(() {
        isLoading = true;
      });

      await authServices.value.resetPassword(email: emailController.text);

      showSuccessDialog(
        // ignore: use_build_context_synchronously
        context,
        message: "Your password reset link has been sent successfully.",
        onContinue: () {
          Navigator.pop(context); // go back to login page
        },
      );

    } on FirebaseAuthException catch (e) {
      setState(() {
        errorText = e.message ?? 'Error while reset password using firebase.';
        showErr();
      });
    } finally {
      if (mounted) {
        isLoading = false;
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
                    "Forgot Password",
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
                    "Recover your account password",
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

                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : MyButton(text: 'Next', onPress: reset),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
