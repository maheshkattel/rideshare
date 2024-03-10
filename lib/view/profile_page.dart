import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import 'package:ridesharingapp/view_model/profile/profile_screen_controller.dart';
import '../resources/colors/color.dart';
import '../resources/components/primary_button.dart';
import 'login_screen/login_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profileVm = ProfileScreenController();

  @override
  void initState() {
    profileVm.getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 59,
                        backgroundImage: NetworkImage(profileVm.image.value),
                      ),
                    ),
                    sizedBox20(),
                    Text(
                      textAlign: TextAlign.center,
                      profileVm.name.value.toString().toUpperCase(),
                      style: AppFontStyle().fontStyle(
                          AppFontSize.titleLarge, AppColors.contentTernary),
                    ),
                    sizedBox20(),
                    ListTile(
                        leading: const Icon(Icons.email_sharp),
                        title: Text(profileVm.email.value.toLowerCase())),
                    ListTile(
                        leading: const Icon(Icons.phone),
                        title: Text('+977 ${profileVm.phone.value}')),
                    ListTile(
                        leading: const Icon(Icons.person_2_sharp),
                        title: Text(profileVm.gender.value.toUpperCase())),
                    ListTile(
                        leading: const Icon(Icons.location_on),
                        title: Text(profileVm.address.value.toUpperCase())),
                    sizedBox20(),
                    PrimaryButton(
                        title: 'Log Out',
                        textColor: AppColors.primaryColor700,
                        borderColor: AppColors.primaryColor700,
                        buttonColor: AppColors.whiteColor,
                        onPress: () {
                          Get.offAll(LoginScreen());
                        })
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
