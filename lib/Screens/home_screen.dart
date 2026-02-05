import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/all_property.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:grand_hotel/widgets/my_crausel.dart';
import 'package:grand_hotel/widgets/my_map.dart';
import 'package:grand_hotel/widgets/property_card.dart';
import 'package:grand_hotel/widgets/recommendation_crad.dart';
import 'package:grand_hotel/widgets/tabs.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int selectedTabIndex = 0;
  late final List<PropertyModel> allProperties = PropertyModel.demoProperties();

  List<PropertyModel> get filteredProperties {
    if (selectedTabIndex == 0) {
      return allProperties.take(3).toList();
    }

    final types = [
      null,
      PropertyType.Villa,
      PropertyType.Hotel,
      PropertyType.Apartment,
    ];

    return allProperties
        .where((p) => p.type == types[selectedTabIndex])
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFFE8F2FF),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: Row(
                    children: [
                      // Left icon
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.location5,
                          size: 18,
                          color: kSurfaceColor,
                        ),
                      ),

                      const SizedBox(width: 10),

                      Expanded(
                        child: Text(
                          "You can change your location to show nearby villas",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: 'Inter_Medium',
                            fontSize: 13,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Icon(Iconsax.arrow_2),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllProperty(),
                          ),
                        ),
                        child: Text(
                          'See All',
                          style: TextStyle(color: kSurfaceColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              MyCrausel(),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Recomended for you",
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllProperty(),
                          ),
                        ),
                        child: Text(
                          'See All',
                          style: TextStyle(color: kSurfaceColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Tabs(
                onTabChanged: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),

                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    return PropertyListCard(
                      propertyId: filteredProperties[index].id,
                      imgUrl: NetworkImage(filteredProperties[index].images[0]),
                      name: filteredProperties[index].name,
                      location: filteredProperties[index].location,
                      price: filteredProperties[index].pricePerNight,
                      rating: filteredProperties[index].rating,
                    );
                  },
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Hotel Near You",
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text('Open Map', style: TextStyle(color: kSurfaceColor)),
                  ],
                ),
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: MyMap(height: 180),
              ),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More Available Stays',
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AllProperty()),
                      ),
                      child: Text(
                        'See All',
                        style: TextStyle(
                          color: kSurfaceColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15),
              RecommendationCrad(),
            ],
          ),
        ),
      ),
    );
  }
}
