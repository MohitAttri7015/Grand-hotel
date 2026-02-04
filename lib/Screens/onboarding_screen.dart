import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/auth_screens/login_screen.dart';
import 'package:grand_hotel/Screens/auth_screens/sign_up_screen.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/widgets/my_button.dart';
import 'package:grand_hotel/widgets/on_boarding_screen1.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();

  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              OnBoardingScreen1(
                bgImage: AssetImage("assets/OnBoarding/onBoard1.jpg"),
                text1: 'Luxury and Comfort, just a Tap Away',
                text2:
                    'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem .',
              ),
              OnBoardingScreen1(
                bgImage: AssetImage("assets/OnBoarding/onBoard2.jpg"),
                text1: 'Book with Ease, Stay with Style',
                text2:
                    'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem .',
              ),
              OnBoardingScreen1(
                bgImage: AssetImage("assets/OnBoarding/onBoard3.jpg"),
                text1: 'Discover Your Dream Hotel, Effortlessly',
                text2:
                    'Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem .',
              ),
            ],
          ),

          // ignore: avoid_unnecessary_containers
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 40.0,
                right: 20.0,
                left: 20.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  !onLastPage ?
                  SmoothPageIndicator(
                    controller: _controller,
                    count: 3,
                    effect: WormEffect(
                      dotColor: kTextColor,
                      activeDotColor: kSurfaceColor,
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ) : SizedBox(height: 1),

                  SizedBox(height: 15),

                  onLastPage
                      ? Column(
                          children: [
                            MyButton(
                              text: 'Get Started',
                              onPress: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen())),
                            ),

                            SizedBox(height: 20),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(color: kTextColor),
                                ),
                                SizedBox(width: 5),
                                GestureDetector(
                                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen(),
                                    )),
                                  child: Text(
                                    "Register",
                                    style: TextStyle(
                                      color: kSurfaceColor,
                                      fontFamily: 'Inter_Medium',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kSurfaceColor,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () => _controller.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeIn,
                            ),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                color: kTextColor,
                                fontFamily: 'Inter_Medium',
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
