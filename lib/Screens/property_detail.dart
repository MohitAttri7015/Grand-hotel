import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:grand_hotel/widgets/my_map.dart';
import 'package:grand_hotel/widgets/reviews_list.dart';
import 'package:iconsax/iconsax.dart';

class PropertyDetail extends StatelessWidget {
  final String propertyId;
  const PropertyDetail({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    final PropertyModel property = PropertyModel.demoProperties().firstWhere(
      (p) => p.id == propertyId,
    );

    return Scaffold(
       bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          // ignore: deprecated_member_use
          border: Border(top: BorderSide(color: thirdTextColor.withOpacity(0.3))),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Price',
                    style: TextStyle(
                      fontFamily: 'Inter_Medium',
                      fontSize: 12,
                      color: thirdTextColor,
                    ),
                  ),
                  Text(
                    '\$${property.pricePerNight.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: 'Inter_Medium',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kSurfaceColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 28),
                  ),
                  onPressed: () {
                    // booking action
                  },
                  child: Text(
                    'Booking Now',
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(property.images[0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          // ignore: deprecated_member_use
                          Colors.black.withOpacity(0.4),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20,
                      ),
                      child: Row(
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
                              child: Icon(
                                Iconsax.backward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),

                          Text(
                            "Detail",
                            style: TextStyle(
                              fontFamily: 'Inter_Medium',
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),

                          Opacity(opacity: 0, child: Text("none")),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Transform.translate(
              offset: Offset(0, -10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              property.name,
                              style: TextStyle(
                                fontFamily: 'Inter_Medium',
                                fontSize: 16,
                              ),
                            ),

                            SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Iconsax.location5,
                                      color: kSurfaceColor,
                                      size: 15,
                                    ),
                                    SizedBox(width: 2),
                                    Text(
                                      property.location,
                                      style: TextStyle(
                                        fontFamily: 'Inter_Light',
                                        fontSize: 12,
                                        color: thirdTextColor,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(width: 20),

                                Text(
                                  '⭐ ${property.rating}',
                                  style: TextStyle(
                                    fontFamily: 'Inter_Medium',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFE8F2FF),
                          ),
                          child: Icon(
                            Iconsax.convert_3d_cube,
                            color: kSurfaceColor,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Check All Facilities',
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),

                        Text(
                          'See All',
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            color: kSurfaceColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 25),

                    Text(
                      'Description',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      property.description,
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        color: thirdTextColor,
                      ),
                    ),

                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),

                        Text(
                          'Open Map',
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            color: kSurfaceColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: const Color.fromARGB(115, 175, 175, 175))
                      ),
                      height: 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyMap(height: 100),
                          Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Iconsax.location5,
                                  color: kSurfaceColor,
                                  size: 20,
                                ),
                                SizedBox(width: 5,),
                                Text(property.location, style: TextStyle(fontFamily: 'Inter_Medium', color: thirdTextColor, fontSize: 15))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),

                        Text(
                          'See All',
                          style: TextStyle(
                            fontFamily: 'Inter_Medium',
                            color: kSurfaceColor,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),

                    ReviewsList(reviews: property.reviews),

          
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
