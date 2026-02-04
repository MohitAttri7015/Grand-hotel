import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/filter_data.dart';
import 'package:grand_hotel/widgets/amenities_checkbox%20.dart';
import 'package:grand_hotel/widgets/fliter_tab.dart';

class DraggableSheet extends StatefulWidget {
  const DraggableSheet({super.key});

  @override
  State<DraggableSheet> createState() => _DraggableSheetState();
}

class _DraggableSheetState extends State<DraggableSheet> {
  RangeValues values = const RangeValues(0, 500);
  late int selectedRating;
  String selectedCategory = '';
  String selectedLocation = '';
  List<String> selectedAmenities = [];
  final categories = ['Villas', 'Hotels', 'Apartments'];
  final locations = ['Berlin', 'New York', 'Malibu', "Dubai", "Tokyo"];

  @override
  void initState() {
    super.initState();
    selectedCategory = categories[0];
    selectedLocation = locations[0];
    selectedRating = 0; 
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // drag handle
                SizedBox(height: 0),
                Divider(thickness: 4, indent: 140, endIndent: 140),

                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Filter By',
                    style: TextStyle(fontSize: 18, fontFamily: 'Inter_Medium'),
                  ),
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Select',
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                  ),
                ),
                SizedBox(height: 10),

                FilterTab(
                  tabs: categories,
                  onTabChanged: (index) {
                    setState(() {
                      selectedCategory = categories[index];
                    });
                  },
                  initialIndex: 0,
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Price',
                        style: TextStyle(
                          fontFamily: 'Inter_Medium',
                          fontSize: 14,
                        ),
                      ),

                      Text(
                        "\$${values.start.toInt()} - \$${values.end.toInt()}",
                        style: TextStyle(
                          fontFamily: 'Inter_Medium',
                          fontSize: 14,
                          color: thirdTextColor,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 10),

                RangeSlider(
                  min: 0,
                  max: 500,
                  values: values,
                  divisions: 50,
                  // labels: labels,
                  onChanged: (newValues) {
                    setState(() {
                      values = newValues;
                    });
                  },
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Select Location',
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                  ),
                ),

                SizedBox(height: 10),

                FilterTab(
                  tabs: locations,
                  onTabChanged: (index) {
                    setState(() {
                      selectedLocation = locations[index];
                    });
                  },
                  initialIndex: 0,
                ),

                SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Facilities',
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                  ),
                ),

                SizedBox(height: 10),

                AmenitiesCheckbox(
                  onChanged: (values) {
                    setState(() {
                      selectedAmenities = values;
                    });
                  },
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Rating',
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 14),
                  ),
                ),

                SizedBox(height: 10),

                FilterTab(
                  tabs: ['⭐ 1', '⭐ 2', '⭐ 3', "⭐ 4", "⭐ 5"],
                  initialIndex: -1,
                  onTabChanged: (index) {
                    setState(() {
                      selectedRating = index + 1;
                    });
                  },
                ),

                SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kSurfaceColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 20),
                      ),
                      onPressed: () {
                        final filter = FilterData(
                          priceRange: values,
                          amenities: selectedAmenities,
                          rating: selectedRating,
                          category: selectedCategory,
                          location: selectedLocation,
                        );
                        Navigator.pop(context, filter);
                      },
                      child: Text(
                        'Apply Filter',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter_Medium',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
