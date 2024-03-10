import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class FirstScreenRepository {
  //get position of the device
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position location;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //         return Future.error('Location services are disabled.');
    // }
    //

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // return Utils.snackBar('title', 'message');
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    if (kDebugMode) {
      print(await Geolocator.getCurrentPosition());
    }

    location = await Geolocator.getCurrentPosition();
    return location;
  }
}
