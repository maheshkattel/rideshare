import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ridesharingapp/repository/map_screen_repo/map_screen_repo.dart';
import '../resources/colors/color.dart';
import '../resources/components/primary_button.dart';
import '../utils/utils.dart';
import 'package:http/http.dart' as http;

class MapScreenController extends GetxController {
  TextEditingController sourceController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  RxDouble sourceLat = 0.0.obs;
  RxDouble sourceLng = 0.0.obs;
  RxDouble destLat = 0.0.obs;
  RxDouble destLng = 0.0.obs;

  FocusNode sourceFocusNode = FocusNode();
  FocusNode destinationFocusNode = FocusNode();
  RxList<dynamic> placesList = [].obs;
  RxList<Marker> marker = <Marker>[].obs;
  RxList<LatLng> polylinePoints = <LatLng>[].obs;
  static RxList<RxString> paymentOptions =
      <RxString>['Cash on Delivery'.obs, 'Card'.obs].obs;
  RxString selectedPaymentOptions = paymentOptions[0];

  RxString sourceHint = 'From'.obs;
  RxString sourcePlaceId = ''.obs;
  RxString destinationPlaceId = ''.obs;
  RxString destinationHint = 'To'.obs;
  final _mapScreenRepository = MapScreenRepository();

  //to show predictions in listTile
  void showPredictions(String input) {
    if (kDebugMode) {
      // print(input);
    }
    _mapScreenRepository.getDetails(input).then((value) {
      // print(value['predictions']);
      placesList.value = value['predictions'];
      if (kDebugMode) {
        // print(placesList);
      }
      update();
    });
  }

  // to update source and destination
  updateSrcDst(value, context) {
    if (sourceFocusNode.hasFocus) {
      placesList.clear();
      sourceController.clear();
      sourceHint.value = value['description'];
      sourcePlaceId.value = value['place_id'];
      print(sourcePlaceId);
      print(sourceHint);
      Utils.fieldFocusChange(context, sourceFocusNode, destinationFocusNode);
      update();
    }
    if (destinationFocusNode.hasFocus) {
      placesList.clear();
      destinationController.clear();
      destinationHint.value = value['description'];
      destinationPlaceId.value = value['place_id'];
      destinationFocusNode.unfocus();
      update();
    }
  }

  // to update polyLines
  Future<void> updatePolyLines() async {
    try {
      var sourceResponse = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?place_id=$sourcePlaceId&key=GOOGLE_API_KEY'));
      var sourceData = jsonDecode(sourceResponse.body);
      sourceLat.value = sourceData['results'][0]['geometry']['location']['lat'];
      sourceLng.value = sourceData['results'][0]['geometry']['location']['lng'];
      update();
      print(
          'polyline point of source is----------------------------------------');
      print(sourceHint);
      print(sourceLat);
      print(sourceLng);
      var destinationResponse = await http.get(Uri.parse(
          'https://maps.googleapis.com/maps/api/geocode/json?place_id=$destinationPlaceId&key=GOOGLE_API_KEY'));
      var destinationData = jsonDecode(destinationResponse.body);
      destLat.value =
          destinationData['results'][0]['geometry']['location']['lat'];
      destLng.value =
          destinationData['results'][0]['geometry']['location']['lng'];
      update();
      print('polyline point of destination is------------------------------');
      print(destinationHint);
      print(destLat);
      print(destLng);
    } catch (e) {
      print(e.toString());
    }
  }

  //draw polyLines
  Future<List<LatLng>> getPolyLinePoints() async {
    List<LatLng> polyPoints = [];
    PolylinePoints points = PolylinePoints();
    PolylineResult result = await points.getRouteBetweenCoordinates(
        Utils.apiKey,
        PointLatLng(26.658193, 87.298150),
        PointLatLng(26.466289, 87.326159));
    // PointLatLng(sourceLat.value, sourceLng.value),
    // PointLatLng(destLat.value, destLng.value));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polyPoints.add(LatLng(point.latitude, point.longitude));
        update();
      }
    }

    polylinePoints.value = polyPoints;
    update();
    print('i am printing polylines value');
    print(polylinePoints);
    return polyPoints;
  }

  //draw marker in map an additional functionality
  void addMarker(context) async {
    Marker markerr = Marker(
        markerId: MarkerId('99'), position: LatLng(26.658193, 87.298150));
    marker.add(markerr);
    marker.add(Marker(
        markerId: MarkerId('98'), position: LatLng(26.466289, 87.326159)));
    // setState(() {
    //   print(_marker);
    // });
    QuerySnapshot<Map<String, dynamic>> snap =
        await FirebaseFirestore.instance.collection('cars').get();
    for (var i = 0; i < snap.docs.length; i++) {
      print(snap.docs[i]['lat']);
      marker.add(Marker(
          markerId: MarkerId(i.toString()),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Mustang GT Neo 8000'),
                  content: Column(
                    children: [
                      Image.asset('assets/images/mustanggt.png',
                          height: 200, fit: BoxFit.fill),
                      Text('Car/Taxi Company: Mustang'),
                      Text('Fuel: Diesel'),
                      Text('Driver: Alex Hales')
                    ],
                  ),
                  actions: [
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                              title: 'Back',
                              buttonColor: Colors.transparent,
                              textColor: AppColors.primaryColor700,
                              borderColor: AppColors.primaryColor700,
                              onPress: () {
                                Get.back();
                              }),
                        ),
                        Expanded(
                          child: PrimaryButton(
                              title: 'Ride Now',
                              onPress: () {
                                Get.back();
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                      title: Text('Choose Payment Option'),
                                      content: Column(
                                        children: [
                                          ListTile(
                                            title: Text('Cash on Delivery'),
                                            leading: Radio(
                                              value: paymentOptions.first,
                                              groupValue:
                                                  selectedPaymentOptions,
                                              onChanged: (value) {
                                                selectedPaymentOptions = value!;
                                                update();
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text('Back')),
                                            Expanded(
                                              child: PrimaryButton(
                                                  title: 'Confirm Order',
                                                  onPress: () {
                                                    print(
                                                        selectedPaymentOptions);
                                                    // Get.back();
                                                    Navigator.pop(context);
                                                    FirebaseFirestore.instance
                                                        .collection('users')
                                                        .doc(FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid)
                                                        .collection('myride')
                                                        .add({
                                                      'time':
                                                          DateTime.timestamp(),
                                                      'car': 'Mustang GT',
                                                      'fuel': 'Diesel',
                                                      'ac': 'yes'
                                                    });
                                                  }),
                                            )
                                          ],
                                        )
                                      ]),
                                );
                              }),
                        ),
                      ],
                    )
                  ],
                );
              },
            );
          },
          position: LatLng(snap.docs[i]['lat'], snap.docs[i]['lng'])));
      update();
    }
  }
}
