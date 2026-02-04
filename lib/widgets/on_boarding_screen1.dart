import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';

class OnBoardingScreen1 extends StatelessWidget {
  final ImageProvider bgImage;
  final String text1;
  final String text2;
  const OnBoardingScreen1({
    super.key,
    required this.bgImage,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(image: bgImage, fit: BoxFit.cover),
          ),
        ),

        Positioned.fill(
          top: 0,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/OnBoarding/overlay.png',
            fit: BoxFit.cover,
          ),
        ),

        Positioned.fill(
          left: 20,
          right: 20,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 150, right: 30, left: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  textAlign: TextAlign.center,
                  text1,
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Inter_Medium',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  textAlign: TextAlign.center,
                  text2,
                  style: TextStyle(
                    color: kTextColor,
                    fontFamily: 'Inter_Light',
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
