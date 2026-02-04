import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';

void showSuccessDialog(
  BuildContext context, {
  required String message,
  VoidCallback? onContinue,
}) {
  showDialog(
    context: context,
    barrierDismissible: false, // user must tap continue
    builder: (_) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Success icon
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
              ),
              padding: const EdgeInsets.all(20),
              child: const Icon(Icons.check, color: Colors.green, size: 40),
            ),
            const SizedBox(height: 20),

            // Title
            const Text(
              "Success",
              style: TextStyle(
                fontFamily: 'Inter_Medium',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Message
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Inter_Medium',
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 25),

            // Continue button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // close dialog
                  if (onContinue != null) onContinue(); // optional callback
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSurfaceColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    fontFamily: 'Inter_Medium',
                    fontSize: 16,
                    color: Colors.white,
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
