import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/property_detail.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:iconsax/iconsax.dart';

class PropertyListCard extends StatelessWidget {
  final String propertyId;
  final ImageProvider imgUrl;
  final String name;
  final String location;
  final double price;
  final double rating;
  const PropertyListCard({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.location,
    required this.price,
    required this.rating, required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double subtitleFontSize;
    double titleFontSize;
    double sWidth;
    if (screenWidth >= 375) {
      subtitleFontSize = 12;
      titleFontSize = 14;
      sWidth = 120;
    } else {
      subtitleFontSize = 11;
      titleFontSize = 12;
      sWidth = 100;
    }

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PropertyDetail(propertyId: propertyId),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: thirdTextColor)),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      image: imgUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 10),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: sWidth,
                        child: Text(
                          name,
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Iconsax.location,
                            size: 14,
                            color: thirdTextColor,
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              color: thirdTextColor,
                              fontSize: subtitleFontSize,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            "\$$price",
                            style: TextStyle(
                              color: kSurfaceColor,
                              fontFamily: 'Inter_Medium',
                            ),
                          ),
                          Text("/night"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              Row(
                children: [
                  Icon(Iconsax.star, color: Colors.amber, size: 16),
                  SizedBox(width: 4),
                  Text(rating.toString()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
