import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  final double height;
  const MyMap({super.key, required this.height});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late LatLng randomLocation;

  @override
  void initState() {
    super.initState();
    randomLocation = getRandomLatLng();
  }

  LatLng getRandomLatLng() {
    final random = Random();

    // Valid world latitude & longitude
    double lat = -90 + random.nextDouble() * 180;
    double lng = -180 + random.nextDouble() * 360;

    return LatLng(lat, lng);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(
        height: widget.height,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: randomLocation,
            zoom: 10,
          ),
          markers: {
            Marker(
              markerId: const MarkerId('random_place'),
              position: randomLocation,
              infoWindow: const InfoWindow(title: 'Random Place'),
            ),
          },
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
        ),
      ),
    );
  }
}
