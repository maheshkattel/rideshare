import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Utils {
  static String apiKey = 'AIzaSyCLybilKu3-cRK5_dIV7n0pI0OFxWsLaxk';

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocusNode, FocusNode nextFocus) {
    currentFocusNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) => Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM_LEFT,
      );

  static snackBar(String title, String message) => Get.snackbar(title, message);
}
