import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_style.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/primary_button.dart';

class UserNavigation extends StatelessWidget {
  const UserNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Welcome',
                style: AppFontStyle().fontStyle(
                    AppFontSize.titleMedium, AppColors.contentSecondary),
              ),
              Text(
                'Have a better Sharing Experience',
                style: AppFontStyle()
                    .fontStyle(AppFontSize.bodyLarge, AppColors.textColor),
              ),
              const SizedBox(height: 201),
              PrimaryButton(
                title: 'Create an Account',
                onPress: () {
                  Get.toNamed(RoutesName.registrationScreen);
                },
              ),
              const SizedBox(height: 20),
              PrimaryButton(
                title: 'Login',
                buttonColor: AppColors.whiteColor,
                textColor: AppColors.primaryColor700,
                borderColor: AppColors.primaryColor700,
                onPress: () {
                  Get.toNamed(RoutesName.loginScreen);
                },
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
