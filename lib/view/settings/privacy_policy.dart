import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/components/app_bar.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Privacy and Policy", centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Privacy Policy for Ride Share',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.headlineSmall, AppColors.blackColor)),
              sizedBox20(),
              Text(
                textAlign: TextAlign.justify,
                'At Rideshare, accessible from rideshare.com, one of our main priorities is the privacy of our visitors. This Privacy Policy document contains types of information that is collected and recorded by rideshare and how we use it.If you have additional questions or require more information about our Privacy Policy, do not hesitate to contact us.This Privacy Policy applies only to our online activities and is valid for visitors to our website with regards to the information that they shared and/or collect in rideshare. This policy is not applicable to any information collected offline or via channels other than this website. Our Privacy Policy was created with the help of the Free Privacy Policy Generator.',
                style: AppFontStyle().fontStyle(
                    AppFontSize.labelMedium, AppColors.contentSecondary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
