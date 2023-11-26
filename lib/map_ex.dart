import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
void main(){
  runApp(MaterialApp(home: MapSample(),));
}
class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition initialPosition = CameraPosition(
    target: LatLng(10.026617, 76.308411),
    zoom: 18.4746,
  );

  static const CameraPosition finalPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(12.9595,77.7479),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: gotoFinalPosition,
        label: const Text('To the Next!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> gotoFinalPosition() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(finalPosition));
  }
}