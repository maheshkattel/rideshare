import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/view/map_screen/search_places_screen.dart';
import '../../view_model/map_screen_controller.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  BitmapDescriptor markericon = BitmapDescriptor.defaultMarker;

  final mapVM = Get.put(MapScreenController());

  @override
  void initState() {
    selectIcon();
    mapVM.getPolyLinePoints().then((value) {
      print(value);
    });
    mapVM.addMarker(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          appBar: appAppBar(title: "Map Screen", centreTitle: true),
          body: SafeArea(
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition: const CameraPosition(
                    target: LatLng(26.454299, 87.277652),
                    zoom: 13.5,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    Completer<GoogleMapController>().complete(controller);
                  },
                  zoomControlsEnabled: false,
                  markers: Set<Marker>.of(mapVM.marker),
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId('polyline'),
                      color: AppColors.primaryColor,
                      width: 6,
                      points: mapVM.polylinePoints,
                    ),
                  },
                ),
                Positioned(
                  bottom: 7,
                  child: Container(
                    width: screenSize,
                    color: Colors.grey.shade200.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          const SizedBox(height: 12),
                          TextField(
                            onTap: () {
                              Get.to(const MapSearchPlacesScreen());
                            },
                            decoration: InputDecoration(
                                hintText: mapVM.sourceHint.value,
                                prefixIcon: const Icon(Icons.location_history),
                                border: const OutlineInputBorder()),
                          ),
                          const SizedBox(height: 12),
                          TextField(
                            onTap: () {
                              Get.to(const MapSearchPlacesScreen());
                            },
                            decoration: InputDecoration(
                                hintText: mapVM.destinationHint.value,
                                prefixIcon: const Icon(Icons.location_on_sharp),
                                border: const OutlineInputBorder()),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  void selectIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)),
            'assets/images/caricon.png')
        .then((value) {
      setState(() {
        markericon = value;
      });
    });
  }
}
