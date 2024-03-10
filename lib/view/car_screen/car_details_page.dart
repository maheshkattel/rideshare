import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/routes/routes_name.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import 'Components/car_features_cntainer.dart';
import 'Components/shared_container_car.dart';

class CarDetailsPage extends StatelessWidget {
  const CarDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  'Mustang Shielby GT',
                  style: AppFontStyle()
                      .fontStyle(AppFontSize.titleMedium, AppColors.blackColor),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.yellowColor,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '4.9 (550 reviews)',
                      style: AppFontStyle().fontStyle(
                          AppFontSize.subheadSmall, AppColors.contentDisabled),
                    ),
                  ],
                ),
                SizedBox(
                  height: 156,
                  child: Center(
                      child: Image.asset(
                    ImageAssets.mustangGtBlack,
                  )),
                ),
                Text(
                  'Specifications',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.headlineSmall, AppColors.textColor),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 75,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SharedContainerCar(
                              icon: Icons.battery_charging_full_sharp,
                              text1: 'Max Power',
                              text2: '2500 hp'),
                          SizedBox(width: 8),
                          SharedContainerCar(
                              icon: CupertinoIcons.fullscreen,
                              text1: 'Fuel',
                              text2: '100km/ lr'),
                          SizedBox(width: 8),
                          SharedContainerCar(
                              icon: Icons.propane_tank,
                              text1: 'Max.Speed',
                              text2: '230km/hr'),
                          SizedBox(width: 8),
                          SharedContainerCar(
                              icon: Icons.line_weight,
                              text1: '0-60 mph',
                              text2: '2.5 sec')
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                // car features
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Car Features',
                      style: AppFontStyle().fontStyle(
                          AppFontSize.headlineSmall, AppColors.textColor),
                    ),
                    const SizedBox(height: 20),
                    const CarContainer(
                      heading: 'Model',
                      text: 'GT5000',
                    ),
                    const CarContainer(
                      heading: 'Capacity',
                      text: '760hp',
                    ),
                    const CarContainer(
                      heading: 'Color',
                      text: 'Red',
                    ),
                    const CarContainer(
                      heading: 'Fuel Type',
                      text: 'Octane',
                    ),
                    const CarContainer(
                      heading: 'Gear Type',
                      text: 'Automatic',
                    )
                  ],
                ),
                const SizedBox(height: 20),
                //Booking Button
                Row(
                  children: [
                    Expanded(
                        child: PrimaryButton(
                            title: 'Book Later',
                            textColor: AppColors.primaryColor700,
                            borderColor: AppColors.primaryColor700,
                            buttonColor: AppColors.whiteColor,
                            onPress: () {
                              Get.toNamed(RoutesName.carRequestRentScreen);
                            })),
                    const SizedBox(width: 10),
                    Expanded(
                        child: PrimaryButton(title: 'Ride Now', onPress: () {}))
                  ],
                ),
                const SizedBox(height: 20)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
