import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:grand_hotel/widgets/reviews_list.dart';
import 'package:iconsax/iconsax.dart';

class AllReviews extends StatelessWidget {
  final String propertyId;
  const AllReviews({super.key, required this.propertyId});

  @override
  Widget build(BuildContext context) {
    final PropertyModel property = PropertyModel.demoProperties().firstWhere(
      (p) => p.id == propertyId,
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    "All Reviews",
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 18),
                  ),
        
                  Opacity(opacity: 0, child: Text("none")),
                ],
              ),
        
              SizedBox(height: 30),
        
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      property.rating.toString(),
                      style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 40),
                    ),
        
                    SizedBox(height: 5),
        
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        if (index < property.rating.floor()) {
                          return Icon(Icons.star, color: Colors.amber, size: 20);
                        } else if (index < property.rating) {
                          return Icon(
                            Icons.star_half,
                            color: Colors.amber,
                            size: 20,
                          );
                        } else {
                          return Icon(
                            Icons.star_border,
                            color: Colors.amber,
                            size: 20,
                          );
                        }
                      }),
                    ),
        
                    SizedBox(height: 5),
        
                    Text(
                      'Based on ${property.reviews.length.toString()} review',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        color: thirdTextColor,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(height: 50),
        
              Text(
                'Reviews (${property.reviews.length.toString()})',
                style: TextStyle(
                  fontFamily: 'Inter_Medium',
                  fontSize: 18,
                ),
              ),
        
              SizedBox(height: 10),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: ReviewsList(reviews: property.reviews, showAll: true),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
