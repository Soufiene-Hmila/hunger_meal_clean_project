import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'dart:math' as math;

@RoutePage()
class LimitedMapScreen extends StatefulWidget {
  const LimitedMapScreen({super.key});

  @override
  _LimitedMapScreenState createState() => _LimitedMapScreenState();
}

class _LimitedMapScreenState extends State<LimitedMapScreen> {

  GoogleMapController? _mapController;

  final LatLng _center = const LatLng(35.8246762, 10.6332087); // Initial map center
  final double _circleRadius = 5000.0; // Radius of the circular zone in meters
  final Set<Circle> _circles = {}; // Set of circles to be displayed on the map
  late Set<Marker> _marker = {}; // Marker to be added to the map


  void _onMapTap(LatLng point) {
    // Calculate the distance between the tapped point and the center of the circle
    double distance = calculateDistance(_center.latitude, _center.longitude, point.latitude, point.longitude);
    if (distance > _circleRadius) {
      // Tapped point is outside the circle, update the center and move the camera
      setState(() {
        _circles.add(
          Circle(
            circleId: const CircleId('limited_zone'),
            center: _center,
            radius: _circleRadius,
            fillColor: Colors.blue.withOpacity(0.1),
            strokeColor: Colors.blue,
            strokeWidth: 1,
          ),
        );
        _mapController?.animateCamera(CameraUpdate.newLatLng(_center));
      });

      // You can show a message to the user indicating that the location is not allowed here
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title: const Text('Restricted Zone'),
      //       content: const Text('Sorry, selecting locations here is not allowed.'),
      //       actions: [
      //         InkWell(
      //           child: const Text('OK'),
      //           onTap: () => Navigator.of(context).pop(),
      //         ),
      //       ],
      //     );
      //   },
      // );

    }
    _addMarker(point);

  }

  void _addMarker(LatLng position) {
    setState(() {
      _marker.add(Marker(
        markerId: const MarkerId('selected_location'),
        position: position,
      ));
    });
  }

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    // Implement your own distance calculation logic here
    // For simplicity, this example uses the Haversine formula
    const double earthRadius = 6371000; // meters
    double dLat = _toRadians(lat2 - lat1);
    double dLon = _toRadians(lon2 - lon1);
    double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);
    double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degree) {
    return degree * math.pi / 180;
  }


  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Limited Map'),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        onTap: _onMapTap,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 13.0,
        ),
        circles: _circles,
        markers: _marker, // Add the marker to the map
      ),
    );
  }

}
