import 'package:flutter/material.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:grand_hotel/widgets/another_property_card.dart';
import 'package:grand_hotel/widgets/tabs.dart';
import 'package:iconsax/iconsax.dart';

class AllProperty extends StatefulWidget {
  const AllProperty({super.key});

  @override
  State<AllProperty> createState() => _AllPropertyState();
}

class _AllPropertyState extends State<AllProperty> {
  late int selectedTabIndex = 0;
  late final List<PropertyModel> allProperties = PropertyModel.demoProperties();

  List<PropertyModel> get filteredProperties {
    if (selectedTabIndex == 0) {
      return allProperties.toList();
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Iconsax.backward),
                    ),
                    Text(
                      "All Available Stays",
                      style: TextStyle(
                        fontFamily: 'Inter_Medium',
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Iconsax.notification, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Tabs(
                onTabChanged: (index) {
                  setState(() {
                    selectedTabIndex = index;
                  });
                },
              ),

              const SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    return AnotherPropertyCard(
                      imgUrl: NetworkImage(filteredProperties[index].images[0]),
                      name: filteredProperties[index].name,
                      location: filteredProperties[index].location,
                      price: filteredProperties[index].pricePerNight,
                      rating: filteredProperties[index].rating,
                      rooms: filteredProperties[index].rooms,
                      bathrooms: filteredProperties[index].bathrooms,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
