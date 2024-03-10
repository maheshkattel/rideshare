import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/view/map_screen/map_screen.dart';
import '../../resources/components/primary_button.dart';
import '../../view_model/map_screen_controller.dart';

class MapSearchPlacesScreen extends StatefulWidget {
  const MapSearchPlacesScreen({super.key});

  @override
  State<MapSearchPlacesScreen> createState() => _MapSearchPlacesScreenState();
}

class _MapSearchPlacesScreenState extends State<MapSearchPlacesScreen> {
  final mapVM = Get.put(MapScreenController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: AppColors.primaryColor50,
          appBar: appAppBar(title: 'Search Places', centreTitle: true),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  TextField(
                    onChanged: (value) async {
                      mapVM.showPredictions(value);
                    },
                    focusNode: mapVM.sourceFocusNode,
                    controller: mapVM.sourceController,
                    decoration: InputDecoration(
                        hintText: mapVM.sourceHint.value,
                        prefixIcon: const Icon(Icons.location_history),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    focusNode: mapVM.destinationFocusNode,
                    controller: mapVM.destinationController,
                    decoration: InputDecoration(
                        hintText: mapVM.destinationHint.value,
                        prefixIcon: const Icon(Icons.location_on_sharp),
                        border: const OutlineInputBorder()),
                    onChanged: (value) {
                      mapVM.showPredictions(value);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: mapVM.placesList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            mapVM.updateSrcDst(
                                mapVM.placesList[index], context);
                            if (kDebugMode) {
                              print(
                                  'I am Selecting place for option-------------------------------');
                            }
                          },
                          title: Text(mapVM.placesList[index]['description']
                              .toString()),
                        );
                      },
                    ),
                  ),
                  PrimaryButton(
                    title: 'Confirm',
                    onPress: () async {
                      // print(mapVM.sourceHint);
                      // print(mapVM.destinationHint);
                      // print(mapVM.sourcePlaceId);
                      // print(mapVM.destinationPlaceId);
                      await mapVM.updatePolyLines();
                      await mapVM.getPolyLinePoints().then((value) {
                        Get.to(() => const MapScreen());
                      });
                      // print(data);
                    },
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
