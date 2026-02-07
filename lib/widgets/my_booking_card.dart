import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';


class MyBookingCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final double rating;
  final double price;
  final String date;
  final String guestInfo;
  const MyBookingCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.date,
    required this.guestInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              image,
              width: 90,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 12),

          /// DETAILS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE + RATING
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const Icon(Iconsax.star1, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// LOCATION
                Row(
                  children: [
                    const Icon(Iconsax.location, size: 14, color: thirdTextColor),
                    const SizedBox(width: 4),
                    Expanded(
                      child: Text(
                        location,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                /// PRICE
                RichText(
                  text: TextSpan(
                    text: "\$${price.toInt()} ",
                    style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    children: const [
                      TextSpan(
                        text: "/night",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 18),

                /// DATES
                Row(
                  children: [
                    const Icon(
                      Iconsax.calendar_1,
                      size: 14,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Dates",
                      style: TextStyle(fontSize: 12, color: thirdTextColor),
                    ),
                    const SizedBox(width: 10),
                    Text(date, style: const TextStyle(fontSize: 12)),
                  ],
                ),

                const SizedBox(height: 6),

                /// GUEST
                Row(
                  children: [
                    const Icon(Iconsax.user, size: 14, color: thirdTextColor),
                    const SizedBox(width: 6),
                    const Text(
                      "Guest",
                      style: TextStyle(fontSize: 12, color: thirdTextColor),
                    ),
                    const SizedBox(width: 10),
                    Text(guestInfo, style: const TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}