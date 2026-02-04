import 'dart:async';
import 'package:flutter/material.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/property_model.dart';
import 'package:grand_hotel/widgets/my_search_nav.dart';
import 'package:grand_hotel/widgets/property_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<PropertyModel> _allProperties = PropertyModel.demoProperties();

  List<PropertyModel> filteredProperties = [];
  Timer? _debounce;

  bool isLoading = false;

  void _onSearchChanged(String query) {
    _debounce?.cancel();

    setState(() {
      isLoading = true;
    });

    _debounce = Timer(const Duration(seconds: 1), () {
      setState(() {
        isLoading = false;

        if (query.isEmpty) {
          filteredProperties = [];
        } else {
          filteredProperties = _allProperties
              .where(
                (property) =>
                    property.name.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
        }
      });
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              MySearchNav(onChanged: _onSearchChanged),
              const SizedBox(height: 30),

              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: CircularProgressIndicator.adaptive(),
                )
              else if (filteredProperties.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "No result found",
                    style: TextStyle(
                      fontSize: 16,
                      color: thirdTextColor,
                      fontFamily: 'Inter_Medium'
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredProperties.length,
                  itemBuilder: (context, index) {
                    final property = filteredProperties[index];
                    return PropertyListCard(
                      imgUrl: NetworkImage(property.images.first),
                      name: property.name,
                      location: property.location,
                      price: property.pricePerNight,
                      rating: property.rating,
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
