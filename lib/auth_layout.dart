import 'package:flutter/material.dart';
import 'package:grand_hotel/main_layout.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:grand_hotel/Screens/splash_screen.dart';


class AuthLayout extends StatelessWidget {
  const AuthLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authServices,
      builder: (context, authService, child) {
        return StreamBuilder(
          stream: authService.authStateChanges,
          builder: (context, snapshot) {
            Widget widget;
            if (snapshot.connectionState == ConnectionState.waiting) {
              widget = Scaffold(body: Center(child: CircularProgressIndicator()));
            } else if (snapshot.hasData) {
              widget = MainLayout();
            } else {
              widget = SplashScreen();
            }
        
            return widget;
          },
        );
      }
    );
  }
}
