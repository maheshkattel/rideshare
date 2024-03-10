import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import '../../resources/colors/color.dart';

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                height: 64,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryColor700),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('15% off',
                              style: AppFontStyle().fontStyle(
                                  AppFontSize.bodyLarge,
                                  AppColors.warningColor)),
                          Text('Black friday',
                              style: AppFontStyle().fontStyle(
                                  AppFontSize.bodySmall,
                                  AppColors.contentDisabled))
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 117,
                        child: PrimaryButton(
                            title: 'Collect', width: 117, onPress: () {}),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
