import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:iconsax/iconsax.dart';

class MyCrausel extends StatefulWidget {
  const MyCrausel({super.key});

  @override
  State<MyCrausel> createState() => _MyCrauselState();
}

class _MyCrauselState extends State<MyCrausel> {
  final List<PropertyModel> property = PropertyModel.demoProperties()
      .where((property) => property.rating >= 4.5)
      .toList();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    double viewportFractionWidth;
    if(screenWidth >= 1170){
      viewportFractionWidth = 0.18;
    }
    else if (screenWidth >= 940) {
      viewportFractionWidth = 0.22;
    }
    else if (screenWidth >= 700) {
      viewportFractionWidth = 0.3;
    } else if (screenWidth >= 600) {
      viewportFractionWidth = 0.35;
    } else if (screenWidth >= 500) {
      viewportFractionWidth = 0.4;
    } else if (screenWidth >= 375) {
      viewportFractionWidth = 0.58;
    } else {
      viewportFractionWidth = 0.66;
    }

    return SizedBox(
      width: double.infinity,
      // height: 350,
      child: CarouselSlider(
        items: property.map((prp) {
          return Container(
            width: 200,
            // height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(prp.images[0]),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // 🔥 Gradient Overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        // ignore: deprecated_member_use
                        Colors.black.withOpacity(0.75),
                      ],
                    ),
                  ),
                ),

                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Iconsax.heart, size: 18),
                  ),
                ),

                // 📝 Text Content
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        prp.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          // fontWeight: FontWeight.bold,
                          fontFamily: 'Inter_Medium',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        prp.location,
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$${prp.pricePerNight}/night",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Iconsax.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text(
                                prp.rating.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 250,
          viewportFraction: viewportFractionWidth,
          enableInfiniteScroll: false,
          padEnds: false,
        ),
      ),
    );
  }
}
