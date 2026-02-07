import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Notifications",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 18),
                ),

                Opacity(opacity: 0, child: Text("none")),
              ],
            ),

            SizedBox(height: 30),

            Center(
              child: Text(
                'No Notifications',
                style: TextStyle(
                  fontFamily: 'Inter_Medium',
                  fontSize: 14,
                  color: thirdTextColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
