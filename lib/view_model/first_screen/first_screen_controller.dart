import 'package:get/get.dart';
import 'package:ridesharingapp/repository/first_screen_repo/first_screen_repo.dart';
import 'package:ridesharingapp/utils/utils.dart';
import '../../resources/routes/routes_name.dart';

class FirstScreenController {
  final _firstScreen = FirstScreenRepository();

  final RxBool loading = false.obs;

  //ask for location
  void getLocation() {
    loading.value = true;
    _firstScreen.determinePosition().then((value) {
      Utils.snackBar('Permission Granted 😊😊',
          'Location access is provided by the User.');
      Get.toNamed(RoutesName.userNavigation);
      loading.value = false;
    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Denied !!',
          'Location is denied by the user or the System is not providing permissions to access the Location.');
    });
  }
}
