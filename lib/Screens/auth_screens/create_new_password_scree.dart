import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/widgets/my_button.dart';
import 'package:grand_hotel/widgets/my_textFeild.dart';
import 'package:iconsax/iconsax.dart';

// ignore: must_be_immutable
class CreateNewPasswordScree extends StatelessWidget {
  CreateNewPasswordScree({super.key});
  TextEditingController pswrdController = TextEditingController();
  TextEditingController confirmPswrdController = TextEditingController();

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
                    "Create a New Password",
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
                    "Enter your new password",
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
                  "New Password",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                ),

                SizedBox(height: 10),

                MyTextfeild(
                  hintText: "Enter new password",
                  controller: pswrdController,
                  obscureText: false,
                ),

                SizedBox(height: 20),

                Text(
                  "Confirm Password",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                ),

                SizedBox(height: 10),

                MyTextfeild(
                  hintText: "Enter OTP",
                  controller: confirmPswrdController,
                  obscureText: false,
                ),

                SizedBox(height: 20),

                MyButton(text: 'Next', onPress: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
