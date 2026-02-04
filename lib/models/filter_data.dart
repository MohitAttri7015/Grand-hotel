import 'package:flutter/material.dart';

class FilterData {
  final RangeValues priceRange;
  final List<String> amenities;
  final int rating;
  final String category;
  final String location;

  FilterData({
    required this.priceRange,
    required this.amenities,
    required this.rating,
    required this.category,
    required this.location,
  });
}
