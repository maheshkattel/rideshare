import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';
import '../../resources/routes/routes_name.dart';

class SelectTransportScreen extends StatelessWidget {
  const SelectTransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text('Select Your Transport',
                style: AppFontStyle()
                    .fontStyle(AppFontSize.titleMedium, AppColors.blackColor)),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.availableCarScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.primaryColor, width: 2),
                            color: AppColors.primaryColor50,
                            borderRadius: BorderRadius.circular(8)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(index == 0
                                ? ImageAssets.carImage
                                : index == 1
                                    ? ImageAssets.bikeImage
                                    : index == 2
                                        ? ImageAssets.cycleImage
                                        : ImageAssets.taxiImage),
                            Text(
                              index == 0
                                  ? 'Car'
                                  : index == 1
                                      ? 'Bike'
                                      : index == 2
                                          ? 'Cycle'
                                          : 'Taxi',
                              style: AppFontStyle().fontStyle(
                                  AppFontSize.subheadLarge,
                                  AppColors.contentPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
