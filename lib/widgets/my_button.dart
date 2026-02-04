import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function()? onPress;
  const MyButton({super.key, required this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: kSurfaceColor,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: kTextColor,
            fontFamily: 'Inter_Medium',
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
