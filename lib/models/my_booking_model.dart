import 'package:grand_hotel/models/property_model.dart';

class MyBookingModel {
  final String bookingId;

  final String propertyId;
  final String propertyName;
  final String image;
  final PropertyType category;
  final String location;
  final double pricePerNight;
  final double rating;

  final String dateRange;
  final int guestCount;
  final String phoneNumber;

  MyBookingModel({
    required this.bookingId,
    required this.propertyId,
    required this.propertyName,
    required this.image,
    required this.category,
    required this.location,
    required this.pricePerNight,
    required this.rating,
    required this.dateRange,
    required this.guestCount,
    required this.phoneNumber,
  });

  factory MyBookingModel.fromProperty({
    required PropertyModel property,
    required String bookingId,
    required String dateRange,
    required int guestCount,
    required String phoneNumber,
  }) {
    return MyBookingModel(
      bookingId: bookingId,
      propertyId: property.id,
      propertyName: property.name,
      image: property.images.isNotEmpty ? property.images.first : '',
      category: property.type,
      location: property.location,
      pricePerNight: property.pricePerNight,
      rating: property.rating,
      dateRange: dateRange,
      guestCount: guestCount,
      phoneNumber: phoneNumber,
    );
  }
}

final List<MyBookingModel> myBookings = [
  MyBookingModel.fromProperty(
    bookingId: "b001",
    property: PropertyModel.demoProperties()[0], 
    dateRange: "12–14 Nov 2025",
    guestCount: 4,
    phoneNumber: "+91 9876543210",
  ),

  MyBookingModel.fromProperty(
    bookingId: "b002",
    property: PropertyModel.demoProperties()[1], 
    dateRange: "20–23 Dec 2025",
    guestCount: 2,
    phoneNumber: "+91 9123456789",
  ),
];
