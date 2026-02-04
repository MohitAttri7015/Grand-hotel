import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class AnotherPropertyCard extends StatelessWidget {
  final ImageProvider imgUrl;
  final String name;
  final String location;
  final double price;
  final double rating;
  final int rooms;
  final int bathrooms;
  const AnotherPropertyCard({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.rooms,
    required this.bathrooms,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// IMAGE + OVERLAYS
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: imgUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              /// ⭐ Rating
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(211, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Iconsax.star, color: Colors.amber, size: 16),
                      SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// 🤍 Heart
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(211, 255, 255, 255),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Iconsax.heart, size: 18),
                ),
              ),
            ],
          ),

          /// DETAILS
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title + Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "\$$price",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                /// Location + per night
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      location,
                      style: TextStyle(color: thirdTextColor, fontSize: 12),
                    ),
                    Text(
                      "Per Night",
                      style: TextStyle(color: thirdTextColor, fontSize: 12),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                /// Beds & Bathrooms
                Row(
                  children: [
                    Icon(Icons.bed_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("$rooms rooms"),

                    SizedBox(width: 16),

                    Icon(Icons.bathtub_outlined, size: 18, color: Colors.grey),
                    SizedBox(width: 4),
                    Text("$bathrooms bathroom"),
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
