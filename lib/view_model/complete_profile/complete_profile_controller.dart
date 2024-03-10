import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ridesharingapp/repository/complete_profile_repo/complete_profile_repo.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import '../../utils/utils.dart';

List<String> gender = ["male", 'female'];
List<String> list = [
  'Achham',
  'Arghakhanchi',
  'Baglung',
  'Baitadi',
  'Bajhang',
  'Bajura',
  'Banke',
  'Bara',
  'Bardiya',
  'Bhaktapur',
  'Bhojpur',
  'Chitwan',
  'Dadeldhura',
  'Dailekh',
  'Dang Deokhuri',
  'Darchula',
  'Dhading',
  'Dhankuta',
  'Dhanusa',
  'Dolakha',
  'Dolpa',
  'Doti',
  'Gorkha',
  'Gulmi',
  'Humla',
  'Ilam',
  'Jajarkot',
  'Jhapa',
  'Jumla',
  'Kailali',
  'Kalikot',
  'Kanchanpur',
  'Kapilvastu',
  'Kaski',
  'Kathmandu',
  'Kavrepalanchok',
  'Khotang',
  'Lalitpur',
  'Lamjung',
  'Mahottari',
  'Makwanpur',
  'Manang',
  'Morang',
  'Mugu',
  'Mustang',
  'Myagdi',
  'Nawalparasi',
  'Nuwakot',
  'Okhaldhunga',
  'Palpa',
  'Panchthar',
  'Parbat',
  'Parsa',
  'Pyuthan',
  'Ramechhap',
  'Rasuwa',
  'Rautahat',
  'Rolpa',
  'Rukum',
  'Rupandehi',
  'Salyan',
  'Sankhuwasabha',
  'Saptari',
  'Sarlahi',
  'Sindhuli',
  'Sindhupalchok',
  'Siraha',
  'Solukhumbu',
  'Sunsari',
  'Surkhet',
  'Syangja',
  'Tanahu',
  'Taplejung',
  'Terhathum',
  'Udayapur',
];

class CompleteProfileController extends GetxController {
  final complete = CompleteProfileRepository();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();

  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final emailFocus = FocusNode();
  final streetFocus = FocusNode();
  final cityFocus = FocusNode();

  RxString imagePath = ''.obs;
  RxBool loading = false.obs;
  final RxString selectedGender = gender[0].obs;
  final RxString selectedDistrict = list.first.obs;

//select gender
  updateGender(String value) {
    selectedGender.value = value;
    update();
  }

  //select district
  selectDistrict(String value) {
    selectedDistrict.value = value;
  }

  //select profile Image
  Future<XFile?> selectProfilePic() async {
    XFile? pickImage;
    try {
      ImagePicker picker = ImagePicker();
      pickImage = await picker.pickImage(source: ImageSource.gallery);
      imagePath.value = pickImage!.path.toString();
      update();
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    update();
    return pickImage;
  }

  //update to database
  void saveUserDetails() async {
    loading.value = true;
    Map<String, dynamic> data = {
      'uid': _auth.currentUser!.uid,
      'email': emailController.text,
      'name': nameController.text,
      'phone': phoneController.text,
      'gender': selectedGender.value,
      'district': selectedDistrict.value,
      'city': cityController.text,
      'street': streetController.text,
      'image': await profileImage(),
    };
    loading.value = true;
    if (_auth.currentUser!.uid.isEmpty ||
        emailController.text.isEmpty ||
        nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        selectedGender.value.isEmpty ||
        selectedDistrict.value.isEmpty ||
        cityController.text.isEmpty ||
        imagePath.isEmpty) {
      Utils.snackBar('Error', 'Please fill all the Fields');
      loading.value = false;
    } else {
      complete.saveUserDetails(data);
      Get.toNamed(RoutesName.homeScreenTransport);
      if (kDebugMode) {
        loading.value = false;
        print('--error while updating profile--');
      }
    }
  }

// upload profile image
  Future<String?> profileImage() async {
    String? imageUrl;
    try {
      var snapshot = await _storage
          .ref('profileImages/${imagePath.split('/').last}')
          .putFile(File(imagePath.value));
      if (kDebugMode) {
        print('image url');
      }
      imageUrl = await snapshot.ref.getDownloadURL();
      if (kDebugMode) {
        print(snapshot.ref.getDownloadURL());
      }
    } catch (e) {
      if (kDebugMode) {
        print('--error on uploading profile pic $e--');
      }
    }
    return imageUrl;
  }
}
