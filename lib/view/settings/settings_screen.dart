import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';
import '../../resources/routes/routes_name.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Settings', centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              SettingsContainer(
                  title: 'Change Password',
                  onTap: () {
                    Get.toNamed(RoutesName.changePasswordScreen);
                  }),
              sizedBox20(),
              SettingsContainer(
                  title: 'Change Language',
                  onTap: () {
                    Get.toNamed(RoutesName.changeLanguage);
                  }),
              sizedBox20(),
              SettingsContainer(
                  title: 'Privacy Policy',
                  onTap: () {
                    Get.toNamed(RoutesName.privacyPolicyScreen);
                  }),
              sizedBox20(),
              SettingsContainer(
                  title: 'Contact Us',
                  onTap: () {
                    Get.toNamed(RoutesName.contactUsScreen);
                  }),
              sizedBox20(),
              SettingsContainer(
                  title: 'Delete Account',
                  onTap: () {
                    Get.toNamed(RoutesName.deleteAccount);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsContainer extends StatelessWidget {
  const SettingsContainer(
      {super.key, required this.onTap, required this.title});

  final String title;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor700)),
      child: ListTile(
        onTap: onTap,
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_sharp),
      ),
    );
  }
}
