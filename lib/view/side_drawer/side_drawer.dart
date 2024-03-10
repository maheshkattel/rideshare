import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import 'package:ridesharingapp/view_model/profile/profile_screen_controller.dart';
import '../../resources/colors/color.dart';
import '../../resources/routes/routes_name.dart';
import '../login_screen/login_screen.dart';

class SideDrawer extends StatefulWidget {
  const SideDrawer({super.key});

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final profileVm = ProfileScreenController();

  @override
  void initState() {
    super.initState();
    profileVm.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Drawer(
          backgroundColor: AppColors.whiteColor,
          width: 270,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  sizedBox20(),
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: NetworkImage(profileVm.image.value),
                  ),
                  Text(profileVm.name.value.toUpperCase(),
                      style: AppFontStyle().fontStyle(AppFontSize.headlineSmall,
                          AppColors.contentSecondary)),
                  Text(profileVm.email.value,
                      style: AppFontStyle().fontStyle(
                          AppFontSize.bodySmall, AppColors.contentSecondary)),
                  sizedBox20(),
                  DrawerListTile(
                    icon: Icons.document_scanner_outlined,
                    title: 'History',
                    onTap: () {
                      Get.toNamed(RoutesName.historyScreen);
                    },
                  ),
                  const Divider(),
                  DrawerListTile(
                    icon: Icons.error_outline_sharp,
                    title: 'Complain',
                    onTap: () {
                      Get.toNamed(RoutesName.complainScreen);
                    },
                  ),
                  const Divider(),
                  DrawerListTile(
                    icon: Icons.people_alt_outlined,
                    title: 'Referrals',
                    onTap: () {
                      Get.toNamed(RoutesName.referralScreen);
                    },
                  ),
                  const Divider(),
                  DrawerListTile(
                    icon: Icons.info_outline_rounded,
                    title: 'About Us',
                    onTap: () {
                      Get.toNamed(RoutesName.aboutUSScreen);
                    },
                  ),
                  const Divider(),
                  DrawerListTile(
                    icon: Icons.settings,
                    title: 'Settings',
                    onTap: () {
                      Get.toNamed(RoutesName.settingsScreen);
                    },
                  ),
                  const Divider(),
                  DrawerListTile(
                    icon: Icons.question_mark_sharp,
                    title: 'Help and Support',
                    onTap: () {
                      Get.toNamed(RoutesName.helpAndSupport);
                    },
                  ),
                  const Divider(),
                  DrawerListTile(
                    icon: Icons.logout_sharp,
                    title: 'Log Out',
                    onTap: () {
                      Get.offAll(LoginScreen());
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.onTap});

  final IconData icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: AppFontStyle()
            .fontStyle(AppFontSize.labelMedium, AppColors.contentSecondary),
      ),
      onTap: onTap,
    );
  }
}
