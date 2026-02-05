import 'dart:math';
import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/property_detail.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:iconsax/iconsax.dart';

class RecommendationCrad extends StatelessWidget {
  const RecommendationCrad({super.key});

  @override
  Widget build(BuildContext context) {
    final allProperties = PropertyModel.demoProperties();

    // 🔥 random 3
    final randomProperties = [...allProperties]..shuffle();
    final properties = randomProperties.take(3).toList();

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];

          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PropertyDetail(propertyId: property.id),
              ),
            ),
            child: Container(
              width: 260,
              margin: EdgeInsets.only(left: 25),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color.fromARGB(60, 0, 0, 0)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  // 🖼 Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      property.images.first,
                      width: 70,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
            
                  const SizedBox(width: 12),
            
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          property.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter_Medium',
                            fontSize: 14,
                          ),
                        ),
            
                        const SizedBox(height: 4),
            
                        Row(
                          children: [
                            const Icon(
                              Iconsax.location5,
                              size: 14,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                property.location,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontFamily: 'Inter_Light',
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
            
                        const SizedBox(height: 6),
            
                        Row(
                          children: [
                            const Icon(
                              Iconsax.star1,
                              size: 14,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              property.rating.toString(),
                              style: const TextStyle(
                                fontFamily: 'Inter_Medium',
                                fontSize: 12,
                                color: Colors.amber,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              "(${property.totalReviews})",
                              style: const TextStyle(
                                fontFamily: 'Inter_Light',
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(width: 6),
            
                            Text(
                              "\$${property.pricePerNight}",
                              style: const TextStyle(
                                fontFamily: 'Inter_Medium',
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
