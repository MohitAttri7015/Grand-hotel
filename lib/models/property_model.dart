// ignore: constant_identifier_names
enum PropertyType { All, Villa, Hotel, Apartment }


class PropertyModel {
  final String id;
  final PropertyType type; // Villa, Hotel, Apartment
  final String name;
  final String location;
  final double pricePerNight;
  final double rating;
  final int totalReviews;
  final String description;
  final int rooms;
  final int bathrooms;
  final String mapUrl;
  final List<String> images;
  final List<FacilityCategory> facilities;
  final List<ReviewModel> reviews;

  PropertyModel({
    required this.id,
    required this.type,
    required this.name,
    required this.location,
    required this.pricePerNight,
    required this.rating,
    required this.totalReviews,
    required this.description,
    required this.rooms,
    required this.bathrooms,
    required this.mapUrl,
    required this.images,
    required this.facilities,
    required this.reviews,
  });

  /// 🔥 STATIC DEMO DATA (6 ITEMS)
  static List<PropertyModel> demoProperties() {
    return [
      // 1️⃣ VILLA
      PropertyModel(
        id: "1",
        type: PropertyType.Villa,
        name: "Ocean View Luxury Villa",
        location: "Malibu, California",
        pricePerNight: 420,
        rating: 4.8,
        totalReviews: 128,
        rooms: 4,
        bathrooms: 3,
        description:
            "A premium ocean-facing villa with private pool, modern interiors, and breathtaking sunset views.",
        mapUrl: "https://maps.google.com/?q=Malibu+California",
        images: [
          "https://images.unsplash.com/photo-1564013799919-ab600027ffc6",
          "https://images.unsplash.com/photo-1600585154340-be6161a56a0c",
        ],
        facilities: [
          FacilityCategory(
            name: "General",
            items: ["Free Wi-Fi", "Air Conditioning", "Private Pool"],
          ),
          FacilityCategory(
            name: "Kitchen",
            items: ["Refrigerator", "Microwave", "Coffee Maker"],
          ),
        ],
        reviews: [
          ReviewModel(
            userName: "Emily Johnson",
            profileImage: "https://randomuser.me/api/portraits/women/44.jpg",
            comment: "Absolutely stunning villa! The ocean view was unreal.",
          ),
        ],
      ),

      // 2️⃣ HOTEL
      PropertyModel(
        id: "2",
        type: PropertyType.Hotel,
        name: "Grand City Hotel",
        location: "New York City, USA",
        pricePerNight: 210,
        rating: 4.5,
        totalReviews: 342,
        rooms: 120,
        bathrooms: 120,
        description:
            "Luxury hotel in the heart of NYC with skyline views and world-class service.",
        mapUrl: "https://maps.google.com/?q=New+York+City",
        images: ["https://images.unsplash.com/photo-1551882547-ff40c63fe5fa"],
        facilities: [
          FacilityCategory(
            name: "Services",
            items: ["24/7 Reception", "Room Service", "Laundry"],
          ),
          FacilityCategory(
            name: "Wellness",
            items: ["Gym", "Spa", "Swimming Pool"],
          ),
        ],
        reviews: [
          ReviewModel(
            userName: "Sarah Lee",
            profileImage: "https://randomuser.me/api/portraits/women/68.jpg",
            comment: "Excellent service and very comfortable rooms.",
          ),
        ],
      ),

      // 3️⃣ APARTMENT
      PropertyModel(
        id: "3",
        type: PropertyType.Apartment,
        name: "Modern City Apartment",
        location: "Berlin, Germany",
        pricePerNight: 120,
        rating: 4.6,
        totalReviews: 96,
        rooms: 2,
        bathrooms: 1,
        description:
            "A stylish apartment located near the city center, perfect for business travelers.",
        mapUrl: "https://maps.google.com/?q=Berlin+Germany",
        images: [
          "https://images.unsplash.com/photo-1523217582562-09d0def993a6",
        ],
        facilities: [
          FacilityCategory(
            name: "Apartment",
            items: ["Elevator", "Balcony", "Smart TV"],
          ),
        ],
        reviews: [
          ReviewModel(
            userName: "Lukas Meyer",
            profileImage: "https://randomuser.me/api/portraits/men/45.jpg",
            comment: "Great location and very clean apartment.",
          ),
        ],
      ),

      // 4️⃣ VILLA
      PropertyModel(
        id: "4",
        type: PropertyType.Villa,
        name: "Mountain Escape Villa",
        location: "Manali, India",
        pricePerNight: 180,
        rating: 4.7,
        totalReviews: 76,
        rooms: 3,
        bathrooms: 2,
        description:
            "A peaceful mountain villa surrounded by nature and scenic views.",
        mapUrl: "https://maps.google.com/?q=Manali+India",
        images: [
          "https://images.unsplash.com/photo-1505691938895-1758d7feb511",
        ],
        facilities: [
          FacilityCategory(
            name: "Outdoor",
            items: ["Bonfire", "Mountain View", "Garden"],
          ),
        ],
        reviews: [
          ReviewModel(
            userName: "Rohit Sharma",
            profileImage: "https://randomuser.me/api/portraits/men/12.jpg",
            comment: "Calm, beautiful and perfect for a getaway.",
          ),
        ],
      ),

      // 5️⃣ HOTEL
      PropertyModel(
        id: "5",
        type: PropertyType.Hotel,
        name: "Desert Pearl Resort",
        location: "Dubai, UAE",
        pricePerNight: 350,
        rating: 4.9,
        totalReviews: 289,
        rooms: 200,
        bathrooms: 200,
        description:
            "A premium desert resort offering luxury suites and world-class dining.",
        mapUrl: "https://maps.google.com/?q=Dubai+UAE",
        images: ["https://images.unsplash.com/photo-1542314831-068cd1dbfeeb"],
        facilities: [
          FacilityCategory(
            name: "Luxury",
            items: ["Infinity Pool", "Private Beach", "Valet Parking"],
          ),
        ],
        reviews: [
          ReviewModel(
            userName: "Ahmed Khan",
            profileImage: "https://randomuser.me/api/portraits/men/76.jpg",
            comment: "One of the best luxury hotels I’ve stayed in.",
          ),
        ],
      ),

      // 6️⃣ APARTMENT
      PropertyModel(
        id: "6",
        type: PropertyType.Apartment,
        name: "Cozy Studio Apartment",
        location: "Tokyo, Japan",
        pricePerNight: 95,
        rating: 4,
        totalReviews: 58,
        rooms: 1,
        bathrooms: 1,
        description:
            "Compact and cozy studio apartment with excellent connectivity.",
        mapUrl: "https://maps.google.com/?q=Tokyo+Japan",
        images: ["https://images.unsplash.com/photo-1554995207-c18c203602cb"],
        facilities: [
          FacilityCategory(
            name: "Essentials",
            items: ["Free Wifi", "Heating", "Kitchenette"],
          ),
        ],
        reviews: [
          ReviewModel(
            userName: "Kenji Tanaka",
            profileImage: "https://randomuser.me/api/portraits/men/29.jpg",
            comment: "Small but very well designed and clean.",
          ),
        ],
      ),
    ];
  }
}

class FacilityCategory {
  final String name;
  final List<String> items;

  FacilityCategory({required this.name, required this.items});
}

class ReviewModel {
  final String userName;
  final String profileImage;
  final String comment;

  ReviewModel({
    required this.userName,
    required this.profileImage,
    required this.comment,
  });
}
