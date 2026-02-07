import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/services/auth_service.dart';
import 'package:grand_hotel/widgets/my_textFeild.dart';
import 'package:iconsax/iconsax.dart';

class UpdateUsername extends StatefulWidget {
  const UpdateUsername({super.key});

  @override
  State<UpdateUsername> createState() => _UpdateUsernameState();
}

class _UpdateUsernameState extends State<UpdateUsername> {
  TextEditingController updateUserController = TextEditingController();
  String? errorText;

  bool isLoading = false;

  void validator() {
    final userName = updateUserController.text.trim();

    if (userName.isEmpty) {
      setState(() {
        errorText = 'Username is required';
      });
      return;
    }
    setState(() {
      errorText = null;
    });
  }

  void showErr() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Invalid Input",
          style: TextStyle(
            fontFamily: 'Inter_Medium',
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          errorText!,
          style: const TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "OK",
              style: TextStyle(fontFamily: 'Inter_Medium'),
            ),
          ),
        ],
      ),
    );
  }

  void updateUsername() async {
    try {
      validator();

      if (errorText != null) {
        showErr();
        return;
      }

       setState(() {
        isLoading = true;
      });

    await authService.updateUserName(username: updateUserController.text);

    await FirebaseAuth.instance.currentUser!.reload();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Username updated successfully')),
        );
        Navigator.pop(context, true);
      }

    } on FirebaseAuthException catch (e) {
      setState(() {
        errorText =
            e.message ?? 'Error while updating username using firebase.';
        showErr();
      });
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Update Username",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 18),
                ),

                SizedBox(height: 10),

                Icon(Iconsax.edit, size: 25),

                SizedBox(height: 10),

                MyTextfeild(
                  hintText: 'Enter New User Name',
                  controller: updateUserController,
                  obscureText: false,
                ),
              ],
            ),


            isLoading ? const Center(child: CircularProgressIndicator())
            : SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  updateUsername();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSurfaceColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Update Username",
                  style: TextStyle(
                    fontFamily: 'Inter_Medium',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
