import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_style.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import 'package:ridesharingapp/view_model/first_screen/first_screen_controller.dart';

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});
  final firstVM = FirstScreenController();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: SafeArea(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.mapImage),
                      fit: BoxFit.fill,
                      opacity: 0.7)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 27),
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12)),
                    height: 459,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 10),
                      child: Column(
                        children: [
                          const CircleAvatar(
                            radius: 55,
                            backgroundColor: AppColors.primaryColor50,
                            child: CircleAvatar(
                              radius: 47,
                              backgroundColor: AppColors.primaryColor100,
                              child: CircleAvatar(
                                radius: 38,
                                backgroundColor: AppColors.primaryColor300,
                                child: CircleAvatar(
                                  radius: 30,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Icon(
                                    Icons.location_on_sharp,
                                    size: 34,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                          Text(
                            'enable_location'.tr,
                            style: AppFontStyle().fontStyle(
                                AppFontSize.titleMedium,
                                AppColors.primaryColor),
                          ),
                          Text(
                            'enable_location_request'.tr,
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadLarge, Colors.grey.shade400),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40),
                          PrimaryButton(
                              title: 'use_my_location'.tr,
                              loading: firstVM.loading.value,
                              onPress: () {
                                firstVM.getLocation();
                              }),
                          const SizedBox(height: 20),
                          PrimaryButton(
                              buttonColor: AppColors.whiteColor,
                              textColor: AppColors.textIconColor,
                              title: 'skip'.tr,
                              onPress: () {
                                // Get.toNamed(RoutesName.userNavigation);
                                Get.toNamed(RoutesName.loginScreen);
                              })
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
