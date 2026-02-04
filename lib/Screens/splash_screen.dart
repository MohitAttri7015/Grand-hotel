import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/onBoarding_screen.dart';
import 'package:grand_hotel/constants/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnBoardingPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSurfaceColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/logo.png')),
            SizedBox(height: 20),
            Text(
              "Grand Hotel",
              style: TextStyle(
                color: kTextColor,
                fontFamily: 'Inter_Medium',
                fontSize: 25,
              ),
            ),
            Text(
              "Find Your Perfect Stay, Anytime, Anywhere",
              style: TextStyle(
                color: kTextColor,
                fontFamily: 'Inter_Light',
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
