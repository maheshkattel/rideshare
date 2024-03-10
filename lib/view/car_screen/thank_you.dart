import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import '../../resources/colors/color.dart';

class ThankYou extends StatelessWidget {
  const ThankYou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
                height: 124, width: 124, child: Image.asset(ImageAssets.pass)),
            Text('Thank You',
                style: AppFontStyle().fontStyle(
                    AppFontSize.headlineLarge, AppColors.contentTernary)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              child: Text(
                  textAlign: TextAlign.center,
                  'Your booking has been placed sent to Mr. Mahesh Kattel',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.bodySmall, AppColors.contentTernary)),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: PrimaryButton(title: 'Confirm Ride', onPress: () {}),
            )
          ],
        ),
      ),
    );
  }
}
