import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class BookingDetailsCard extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final double rating;
  final String price;
  final String date;
  final String guestInfo;
  final String phone;
  final String type;
  const BookingDetailsCard({
    super.key,
    required this.image,
    required this.name,
    required this.location,
    required this.rating,
    required this.price,
    required this.date,
    required this.guestInfo,
    required this.phone, 
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
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
                  "Booking Details",
                  style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 16),
                ),
      
                Opacity(opacity: 0, child: Text("none")),
              ],
            ),
      
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        image.isNotEmpty
                            ? image
                            : "https://via.placeholder.com/150",
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
      
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  name.isNotEmpty ? name : "Unknown Property",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              const Icon(
                                Iconsax.star1,
                                color: Colors.amber,
                                size: 16,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                rating.toString().isNotEmpty
                                    ? rating.toString()
                                    : '0.0',
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Iconsax.location,
                                size: 14,
                                color: thirdTextColor,
                              ),
                              SizedBox(width: 4),
                              Text(
                                location.isNotEmpty
                                    ? location
                                    : "Unknown Location",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: thirdTextColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "\$${price.isNotEmpty ? price : 0} /night",
                            style: TextStyle(
                              color: kSurfaceColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 16),
      
                /// LOCATION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Location",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    Text(
                      "Open Map",
                      style: TextStyle(
                        fontSize: 13,
                        color: kSurfaceColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
      
                const SizedBox(height: 8),
      
                /// MAP PLACEHOLDER
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    height: 140,
                    width: double.infinity,
                    color: Colors.grey.shade300,
                    child: const Icon(Iconsax.map, size: 40, color: Colors.grey),
                  ),
                ),
      
                const SizedBox(height: 16),
      
                /// YOUR BOOKING
                const Text(
                  "Your Booking",
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 10),
      
                _infoRow(Iconsax.calendar_1, "Dates", date.isNotEmpty ? date : "Unknown Date"),
                _infoRow(Iconsax.user, "Guest", guestInfo.isNotEmpty ? guestInfo : "Unknown Guest Info"),
                _infoRow(Iconsax.home, "Type", type.isNotEmpty ? type : "Unknown Type"),
                _infoRow(Iconsax.call, "Phone", phone.isNotEmpty ? phone : "Unknown Phone"),
      
                const SizedBox(height: 16),
      
                /// BARCODE
                Center(
                  child: Column(
                    children: [
                      Container(
                        height: 50,
                        width: double.infinity,
                        color: Colors.black,
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        "06158310-5427-47fd-a11f-bd9029b",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _infoRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 17, color: thirdTextColor),
              const SizedBox(width: 8),
              SizedBox(
                width: 80,
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 13, color: thirdTextColor),
                ),
              ),
            ],
          ),
          Text(value, style: const TextStyle(fontSize: 13, fontFamily: 'Inter_Medium')),
        ],
      ),
    );
  }
}
