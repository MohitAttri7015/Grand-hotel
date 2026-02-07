import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/help_support.dart';
import 'package:grand_hotel/Screens/legal_policies.dart';
import 'package:grand_hotel/Screens/notification_screen.dart';
import 'package:grand_hotel/Screens/personal_info.dart';
import 'package:grand_hotel/Screens/update_username.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:grand_hotel/widgets/setting_tiles.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Icon
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFF41F52),
                      width: 2,
                    ),
                  ),
                  child: const Icon(
                    Iconsax.message_question,
                    color: Color(0xFFF41F52),
                    size: 32,
                  ),
                ),

                const SizedBox(height: 20),

                // Title
                const Text(
                  "Are You Sure?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter_Medium',
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Do you want to log out ?",
                  style: TextStyle(
                    fontSize: 12,
                    color: thirdTextColor,
                    fontFamily: 'Inter_Medium',
                  ),
                ),

                const SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          authService.signOut();
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFF41F52),
                          side: const BorderSide(color: Color(0xFFF41F52)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Log Out",
                          style: TextStyle(fontFamily: 'Inter_Medium'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2947A9),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter_Medium',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = authService.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Profile',
                  style: const TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter_Medium',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Profile Header
              Row(
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.transparent,
                    backgroundImage: user?.photoURL != null
                        ? NetworkImage(user!.photoURL!)
                        : const AssetImage('assets/user-profile.png'),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.displayName ?? 'Username',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter_Medium',
                        ),
                      ),
                      SizedBox(height: 3),
                      Text(
                        "@${(user?.displayName ?? 'user').split(' ').first}",
                        style: TextStyle(
                          fontSize: 13,
                          color: thirdTextColor,
                          fontFamily: 'Inter_Medium',
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const UpdateUsername(),
                        ),
                      );

                      if (result == true) {
                        await authService.currentUser?.reload();
                        setState(() {});
                      }
                    },

                    child: Icon(Iconsax.edit, size: 20),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Setting",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: thirdTextColor,
                  fontFamily: 'Inter_Medium',
                ),
              ),

              const SizedBox(height: 7),

              SettingsTile(
                icon: Iconsax.user,
                title: "Personal Information",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PersonalInfoScreen(),
                    ),
                  );
                },
              ),
              SettingsTile(
                icon: Iconsax.notification,
                title: "Notification",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                    ),
                  );
                },
              ),
              SettingsTile(
                icon: Iconsax.info_circle,
                title: "Help & Support",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HelpSupport(),
                    ),
                  );
                },
              ),
              SettingsTile(
                icon: Iconsax.document,
                title: "Legal & Policies",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LegalPolicies()),
                  );
                },
              ),

              Center(
                child: TextButton(
                  onPressed: () {
                    showLogoutDialog(context);
                  },
                  child: const Text(
                    "Logout",
                    style: TextStyle(
                      color: Color(0xFFF41F52),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
