import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class MySearchNav extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const MySearchNav({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () => Navigator.pop(context),
              icon: Icon(Iconsax.backward),
            ),
            Text(
              "Search",
              style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 16),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(Iconsax.notification, size: 20),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 20),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Iconsax.search_favorite,
                color: thirdTextColor,
                size: 20,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  onChanged: onChanged,
                  decoration: const InputDecoration(
                    hintText: "Search...",
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Iconsax.filter,
                  size: 20,
                  color: thirdTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
