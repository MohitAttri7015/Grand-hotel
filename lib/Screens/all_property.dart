import 'package:flutter/material.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:grand_hotel/widgets/my_search_nav.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Iconsax.backward),
                  ),
                  Text(
                    "All Available Stays",
                    style: TextStyle(fontFamily: 'Inter_Medium', fontSize: 16),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Iconsax.notification, size: 20),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}