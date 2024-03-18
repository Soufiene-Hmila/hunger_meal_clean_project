import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hunger_meal/config/routes/routes.gr.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:hunger_meal/src/map/open_street_map_search_and_pick.dart';
import 'package:hunger_meal/widget/field_action_button.dart';
import 'package:latlong2/latlong.dart';

@RoutePage()
class LocationPickerScreen extends StatefulWidget {

  final bool navigatorSource;
  final Function(PickedData? pickedData) voidCallback;
  const LocationPickerScreen({super.key, this.navigatorSource = false, required this.voidCallback});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {

  Position? _selectedLatLng;

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      setState(() => _selectedLatLng = position);
    }).catchError((e) {
      debugPrint(e);
    });
  }


  @override
  void initState() {
    _getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppThemeMode.thirdColor,
      body: OpenStreetMapSearchAndPick(
          center: LatLong(
              _selectedLatLng?.latitude ?? 36.8178,
              _selectedLatLng?.longitude ?? 10.1793
          ),
          buttonColor: AppThemeMode.primaryColor,
          buttonText: 'Pick Location',
          onPicked: (pickedData) {
            print(pickedData.latLong.latitude);
            print(pickedData.latLong.longitude);
            print(pickedData.address);
            context.router.pop([
              widget.voidCallback(pickedData)
            ]);
          }),
    );
  }
}
