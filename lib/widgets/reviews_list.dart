import 'package:flutter/material.dart';
import 'package:grand_hotel/models/property_model.dart';

class ReviewsList extends StatelessWidget {
  final List<ReviewModel> reviews;

  const ReviewsList({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    // show only first 2 reviews
    final visibleReviews = reviews.take(2).toList();

    return Column(
      children: List.generate(visibleReviews.length, (index) {
        final review = visibleReviews[index];

        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Image
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage(review.profileImage),
            ),
        
            const SizedBox(width: 12),
        
            // Name + Comment
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    review.userName,
                    style: const TextStyle(
                      fontFamily: 'Inter_Medium',
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    review.comment,
                    style: const TextStyle(
                      fontFamily: 'Inter_Light',
                      fontSize: 13,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
