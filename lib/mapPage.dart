import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  static const LatLng _pGoogleplex = LatLng(37.4223, -122.0848);
  static const LatLng _pInatel = LatLng(-22.2573, -45.6964);
  static const LatLng _pChapa = LatLng(-22.25442042386457, -45.70149391796518);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 255, 192, 147),
          shadowColor: Colors.amber,
          title: Text(
            'MAPA GUIDE',
            style: GoogleFonts.rowdies(),
          ),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _pInatel,
            zoom: 13,
          ),
          markers: {
            Marker(
                markerId: MarkerId('_currentLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: _pInatel),
            Marker(
                markerId: MarkerId('_sourceLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: _pChapa)
          },
        ));
  }
}
