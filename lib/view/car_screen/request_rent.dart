import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import 'package:ridesharingapp/resources/components/text_field_form.dart';
import '../../resources/colors/color.dart';
import '../../resources/routes/routes_name.dart';

class RequestRent extends StatelessWidget {
  const RequestRent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Request for Rent', centreTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: AppColors.warningColor,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Current Location',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadLarge,
                                AppColors.contentTernary)),
                        Text('Current location details ',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.caption, AppColors.contentDisabled))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.location_on_sharp,
                      color: AppColors.primaryColor300,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Office',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadLarge,
                                AppColors.contentTernary)),
                        Text('Office Details details ',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.caption, AppColors.contentDisabled))
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 78,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor50,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Mustang Shelby GT',
                              style: AppFontStyle().fontStyle(
                                  AppFontSize.subheadLarge,
                                  AppColors.contentTernary),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: AppColors.yellowColor),
                                const SizedBox(width: 10),
                                Text(
                                  '4.9 (555 reviews)',
                                  style: AppFontStyle().fontStyle(
                                      AppFontSize.subheadSmall,
                                      AppColors.contentTernary),
                                )
                              ],
                            )
                          ],
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 93,
                          height: 56,
                          child: Image.asset(ImageAssets.mustangGt),
                        )
                      ],
                    ),
                  ),
                ),
                sizedBox20(),
                AppTextFormField(
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  hintText: 'Date',
                  onSubmit: (value) {},
                  regExp: RegExp(r'[a-zA-Z]$'),
                ),
                sizedBox20(),
                AppTextFormField(
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  hintText: 'Time',
                  onSubmit: (value) {},
                  regExp: RegExp(r'[a-zA-Z]$'),
                ),
                sizedBox20(),
                Text(
                  'Select Payment Method',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.headlineSmall, AppColors.contentTernary),
                ),
                sizedBox20(),
                Container(
                  height: 69,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 12),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 35,
                          width: 45,
                          child: Image.asset(ImageAssets.visa),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '**** **** **** 1234',
                              style: AppFontStyle().fontStyle(
                                  AppFontSize.bodyLarge, AppColors.blackColor),
                            ),
                            Text(
                              'expires on: 12/26',
                              style: AppFontStyle().fontStyle(
                                  AppFontSize.labelMedium,
                                  AppColors.contentDisabled),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                sizedBox20(),
                PrimaryButton(
                    title: 'Confirm Booking',
                    onPress: () {
                      Get.toNamed(RoutesName.thankYouScreen);
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
