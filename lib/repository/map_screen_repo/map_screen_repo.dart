import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/data/network/network_api_services.dart';
import '../../resources/app_url/app_url.dart';
import '../../utils/utils.dart';

class MapScreenRepository extends GetxController {
  final obj = NetworkApiServices();
  String baseUrl = AppUrl.baseUrl;
  String api = Utils.apiKey;
  Future<dynamic> getDetails(String input) async {
    try {
      var response = await obj
          .getApi('$baseUrl?input=$input&key=$api&components=country:NP');

      return response;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
