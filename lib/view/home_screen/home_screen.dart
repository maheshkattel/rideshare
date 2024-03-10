import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridesharingapp/view/map_screen/map_screen.dart';
import 'package:ridesharingapp/view_model/profile/profile_screen_controller.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/primary_button.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final profileVM = ProfileScreenController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(26.454299, 87.277652),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController controller) {
                Completer<GoogleMapController>().complete(controller);
              },
            ),
            Positioned(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  children: [
                    //Status bar menus and notification
                    const SizedBox(height: 113),
                    const Expanded(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundColor: AppColors.primaryColor100,
                        child: CircleAvatar(
                          radius: 60,
                          backgroundColor: AppColors.primaryColor200,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: AppColors.primaryColor300,
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor700,
                              radius: 14,
                              child: Icon(Icons.location_on_sharp),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.primaryColor100),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 11),
                        child: Column(
                          children: [
                            Container(
                              color: Colors.grey.shade200,
                              child: TextField(
                                onTap: () {
                                  Get.to(() => MapScreen());
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.search_sharp),
                                    hintText: 'Where would you go?'),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                    child: PrimaryButton(
                                        title: 'Transport', onPress: () {})),
                                Expanded(
                                    child: PrimaryButton(
                                        title: 'Delivery', onPress: () {})),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
