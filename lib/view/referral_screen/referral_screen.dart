import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/colors/color.dart';

class ReferralScreen extends StatelessWidget {
  const ReferralScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Referral', centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Refer a friend and Earn \$20',
                style: AppFontStyle().fontStyle(
                    AppFontSize.headlineLarge, AppColors.contentTernary),
              ),
              sizedBox20(),
              Container(
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.contentDisabled)),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Text(
                            'Coder Mahesh',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadLarge,
                                AppColors.contentTernary),
                          ),
                          const Spacer(),
                          const Icon(Icons.copy),
                        ],
                      ))),
              sizedBox20(),
              PrimaryButton(title: 'Invite', onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
