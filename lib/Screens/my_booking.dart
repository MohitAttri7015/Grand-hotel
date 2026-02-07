import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grand_hotel/Screens/booked_detail.dart';
import 'package:grand_hotel/constants/app_constants.dart';
import 'package:grand_hotel/models/my_booking_model.dart';
import 'package:grand_hotel/widgets/my_booking_card.dart';
import 'package:grand_hotel/widgets/my_search_nav.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  final List<MyBookingModel> _allMyBookings = myBookings;
  Timer? _debounce;

  bool isLoading = false;

  List<MyBookingModel> filteredMyBookings = [];

  void _onSearchChanged(String query) {
    _debounce?.cancel();

    setState(() {
      isLoading = true;
    });

    _debounce = Timer(const Duration(milliseconds: 400), () {
      setState(() {
        isLoading = false;

        if (query.isEmpty) {
          filteredMyBookings = List.from(_allMyBookings);
        } else {
          filteredMyBookings = _allMyBookings
              .where(
                (booking) => booking.propertyName.toLowerCase().contains(
                  query.toLowerCase(),
                ),
              )
              .toList();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    filteredMyBookings = List.from(_allMyBookings);
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
              MySearchNav(onChanged: _onSearchChanged, showFilter: false, text: "My Bookings", showBackButton: false),
              const SizedBox(height: 30),

              if (isLoading)
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: CircularProgressIndicator.adaptive(),
                )
              else if (filteredMyBookings.isEmpty)
                const Padding(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "No result found",
                    style: TextStyle(
                      fontSize: 16,
                      color: thirdTextColor,
                      fontFamily: 'Inter_Medium',
                    ),
                  ),
                )
              else
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredMyBookings.length,
                  itemBuilder: (context, index) {
                    final booking = filteredMyBookings[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookingDetailsCard(
                            image: booking.image,
                            name: booking.propertyName,
                            location: booking.location,
                            rating: booking.rating,
                            price: booking.pricePerNight.toString(),
                            date: booking.dateRange,
                            guestInfo: booking.guestCount.toString(),
                            phone: booking.phoneNumber,
                            type: booking.category.name,
                          ),
                        ),
                      ),
                      child: MyBookingCard(
                        image: booking.image,
                        name: booking.propertyName,
                        location: booking.location,
                        rating: booking.rating,
                        price: booking.pricePerNight,
                        date: booking.dateRange,
                        guestInfo: booking.guestCount.toString(),
                      ),
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
