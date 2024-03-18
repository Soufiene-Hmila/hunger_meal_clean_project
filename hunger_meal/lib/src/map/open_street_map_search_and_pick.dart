import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:hunger_meal/config/themes/app_theme.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;

class OpenStreetMapSearchAndPick extends StatefulWidget {

  final LatLong center;
  final void Function(PickedData pickedData) onPicked;
  final Color buttonColor;
  final String buttonText;
  const OpenStreetMapSearchAndPick({
    Key? key,
    required this.center,
    required this.onPicked,
    this.buttonColor = Colors.blue,
    this.buttonText = 'Set Current Location',
  }) : super(key: key);

  @override
  State<OpenStreetMapSearchAndPick> createState() => _OpenStreetMapSearchAndPickState();
}

class _OpenStreetMapSearchAndPickState extends State<OpenStreetMapSearchAndPick> {

  MapController _mapController = MapController();
  late String _searchController = '';
  var client = http.Client();

  bool locationTextContainerEnable = true;

  void setNameCurrentPos() async {
    double latitude = _mapController.center.latitude;
    double longitude = _mapController.center.longitude;
    if (kDebugMode) {
      print(latitude);
    }
    if (kDebugMode) {
      print(longitude);
    }
    String url = 'https://nominatim.openstreetmap.org/reverse?accept-language=fr&format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';

    var response = await client.post(Uri.parse(url));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

    _searchController = decodedResponse['display_name'] ?? "MOVE TO CURRENT POSITION";
    setState(() {});
  }

  void setNameCurrentPosAtInit() async {
    double latitude = widget.center.latitude;
    double longitude = widget.center.longitude;
    String url = 'https://nominatim.openstreetmap.org/reverse?accept-language=fr&format=json&lat=$latitude&lon=$longitude&zoom=18&addressdetails=1';
    var response = await client.post(Uri.parse(url));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;
    _searchController = decodedResponse['display_name'] ?? "MOVE TO CURRENT POSITION";
    setState(() {});
  }

  @override
  void initState() {
    _mapController = MapController();

    setNameCurrentPosAtInit();

    _mapController.mapEventStream.listen((event) async {
      if (event is MapEventMove){
        setState(() => locationTextContainerEnable = false);
      }
      if (event is MapEventMoveEnd) {
        String url = 'https://nominatim.openstreetmap.org/reverse?accept-language=fr&format=json&lat=${event.center.latitude}&lon=${event.center.longitude}&zoom=18&addressdetails=1';
        var response = await client.post(Uri.parse(url));
        var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map<dynamic, dynamic>;

        _searchController = decodedResponse['display_name'];
        setState(() => locationTextContainerEnable = true);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  // final LatLngBounds restrictedBounds = LatLngBounds(
  //   const LatLng(35.7811, 10.6411), // Southwest corner of Sousse
  //   const LatLng(35.9071, 10.6952), // Northeast corner of Sousse
  // );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          Positioned.fill(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(widget.center.latitude, widget.center.longitude),
                  zoom: 15.0, maxZoom: 18, minZoom: 6,
                  interactiveFlags: InteractiveFlag.all & ~InteractiveFlag.rotate, // Disable rotation
                  /// bounds: restrictedBounds,
                ),
                mapController: _mapController,
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.dmsh.hunger_meal',
                    subdomains: const ['a', 'b', 'c'],
                  ),
                ],
              )),

          Positioned.fill(child: IgnorePointer(child: Center(
              child: Icon(Icons.location_pin, size: 50, color: widget.buttonColor),),)),

          Positioned(
              top: 56, right: 12,
              child: FloatingActionButton(
                heroTag: 'btn3', elevation: 1,
                backgroundColor: widget.buttonColor,
                onPressed: () {
                  _mapController.move(
                      LatLng(
                          widget.center.latitude,
                          widget.center.longitude
                      ), _mapController.zoom);
                  setNameCurrentPos();
                  setState(() => locationTextContainerEnable = true);
                },
                child: const Icon(Icons.my_location),
              )),

          Positioned(
              top: 56, left: 12,
              child: FloatingActionButton(
                heroTag: 'btn9', elevation: 1,
                backgroundColor: widget.buttonColor,
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.clear),
              )),

          Positioned(left: 10, right: 10,
            bottom: locationTextContainerEnable ? 30 : -200,
            child: Container(
              padding: const EdgeInsets.only(
                top: 15, left: 10, right: 10, bottom: 10),
              decoration: BoxDecoration(
                color: AppThemeMode.textColorWhite,
                borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Text(_searchController, textAlign: TextAlign.center,);
                  }),
                  const SizedBox(height: 15,),
                  StatefulBuilder(builder: (context, setState) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(elevation: 0.4,
                        backgroundColor: AppThemeMode.primaryColor,
                        minimumSize: Size(MediaQuery.of(context).size.width, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // <-- Radius
                        ),
                      ),
                      child: Text(widget.buttonText, textAlign: TextAlign.center,
                        style: const TextStyle(fontWeight: FontWeight.w600,
                            fontSize: 16, color: AppThemeMode.thirdColor),
                      ),
                      onPressed: () {
                        widget.onPicked(PickedData(LatLong(
                            _mapController.center.latitude,
                            _mapController.center.longitude
                        ), _searchController));
                        Navigator.pop(context);
                      },
                    );
                  }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

}

class LatLong {
  final double latitude;
  final double longitude;
  LatLong(this.latitude, this.longitude);
}

class PickedData {
  final LatLong latLong;
  final String address;

  PickedData(this.latLong, this.address);
}
