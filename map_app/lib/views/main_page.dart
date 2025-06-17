import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

//AIzaSyCXfFC-ZF_8nH3Q9mW-km83PazXzTK4UzM
class _MainPageState extends State<MainPage> {
  List<Marker> _markers = [];
  BitmapDescriptor? customIkon;

  void createIkon() {
    ImageConfiguration i1 = ImageConfiguration();
    BitmapDescriptor.fromAssetImage(i1, 'images/bugatti-chiron-seeklogo.png'); 
  }

  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  final CameraPosition _start = CameraPosition(
    zoom: 4,
    target: LatLng(40.9769097, 28.6667981),
  );

  Future<void> _goToLocation() async {
    GoogleMapController controller = await _mapController.future;

    final _goMarker = Marker(
      markerId: MarkerId('0'),
      position: LatLng(37.3096516, -122.1261991),
      infoWindow: InfoWindow(title: 'Cupertino', snippet: 'Apple'),
    );

    setState(() {
      _markers.add(_goMarker);
    });

    var goThere = CameraPosition(
      target: LatLng(37.3096516, -122.1261991),
      zoom: 12,
    );
    await controller.animateCamera(CameraUpdate.newCameraPosition(goThere));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 20,
              child: GoogleMap(
                markers: Set<Marker>.of(_markers),
                myLocationButtonEnabled: false,
                zoomControlsEnabled: true,
                initialCameraPosition: _start,
                mapType: MapType.normal,
                onMapCreated: (controller) {
                  _mapController.complete(controller);
                },
              ),
            ),
            Expanded(
              flex: 3,
              child: ElevatedButton(
                onPressed: () {
                  _goToLocation();
                },
                child: Text('Go'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
