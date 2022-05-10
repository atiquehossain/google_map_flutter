import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final List<Marker> _marker = [];
  final List<Marker> _markerList = const [
    Marker(
        markerId: MarkerId('1'),
        position: LatLng(23.775438548233303, 90.36458693206825),
        infoWindow: InfoWindow(title: "Test one")),
    Marker(
        markerId: MarkerId('2'),
        position: LatLng(23.7530425180545, 90.380953117583),
        infoWindow: InfoWindow(title: "test two")),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _marker.addAll(_markerList);
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:GoogleMap(
          myLocationEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: _kGooglePlex,
          markers: Set<Marker>.of(_marker),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}
