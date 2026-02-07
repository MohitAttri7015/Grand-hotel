import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class LegalPolicies extends StatelessWidget {
  const LegalPolicies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(95, 255, 255, 255),
                    ),
                    child: Icon(Iconsax.backward, size: 20),
                  ),
                ),

                Text(
                  "Legal & Policies",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 18),
                ),

                Opacity(opacity: 0, child: Text("none")),
              ],
            ),

            SizedBox(height: 30),

            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terms',
                      style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 11,
                        color: thirdTextColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 11,
                        color: thirdTextColor,
                      ),
                    ),
                
                    SizedBox(height: 20),
                
                    Text(
                      'Changes to the Service and/or Terms:',
                      style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 11,
                        color: thirdTextColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget ornare quam vel facilisis feugiat amet sagittis arcu, tortor. Sapien, consequat ultrices morbi orci semper sit nulla. Leo auctor ut etiam est, amet aliquet ut vivamus. Odio vulputate est id tincidunt fames.',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 11,
                        color: thirdTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
