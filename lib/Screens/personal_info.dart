import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/auth_screens/read_only_inout.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:iconsax/iconsax.dart';
import 'package:grand_hotel/constants/app_constants.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = authService.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Iconsax.backward),
                  ),
                  const Expanded(
                    child: Text(
                      "Personal Info",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter_Medium',
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0,
                    child: Text("hello")
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // Full Name
              const Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter_Medium',
                  color: thirdTextColor,
                ),
              ),
              const SizedBox(height: 8),
              ReadOnlyField(text: user?.displayName ?? 'Username'),

              const SizedBox(height: 20),

              // Email
              const Text(
                "Email",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'Inter_Medium',
                  color: thirdTextColor,
                ),
              ),
              const SizedBox(height: 8),
              ReadOnlyField(text: user?.email ?? 'Email not available'),
            ],
          ),
        ),
      ),
    );
  }
}
