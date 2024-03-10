import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';
import '../../resources/routes/routes_name.dart';

class AvailableCarScreen extends StatelessWidget {
  const AvailableCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Available Cars for Ride',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.titleMedium, AppColors.blackColor)),
              const SizedBox(height: 8),
              Text('18 Cars Found',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.labelLarge, AppColors.contentTernary)),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 5),
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.primaryColor, width: 2)),
                        height: 170,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 13),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'BMW Cabrio',
                                        style: AppFontStyle().fontStyle(
                                            AppFontSize.subheadLarge,
                                            AppColors.contentTernary),
                                      ),
                                      Text(
                                        'Automatic | 3 Sests | Octane',
                                        style: AppFontStyle().fontStyle(
                                            AppFontSize.bodySmall,
                                            AppColors.contentDisabled),
                                      ),
                                      Text(
                                        '800m, (5 mins away)',
                                        style: AppFontStyle().fontStyle(
                                            AppFontSize.labelSmall,
                                            AppColors.contentSecondary),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                      height: 59,
                                      width: 101,
                                      child: Image(
                                          image: AssetImage(
                                              ImageAssets.mustangGtBlack)))
                                ],
                              ),
                              const SizedBox(height: 24),
                              PrimaryButton(
                                title: 'View Car List',
                                onPress: () {
                                  Get.toNamed(RoutesName.availableCarList);
                                },
                                buttonColor: AppColors.primaryColor50,
                                borderColor: AppColors.primaryColor,
                                textColor: AppColors.primaryColor,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
