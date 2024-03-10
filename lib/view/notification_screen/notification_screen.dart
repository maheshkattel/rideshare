import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/colors/color.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/app_container.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Notification', centreTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Today',
                  style: AppFontStyle()
                      .fontStyle(AppFontSize.bodyLarge, AppColors.blackColor),
                ),
                const SizedBox(height: 15),
                AppContainer(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Payment Confirmed',
                          style: AppFontStyle().fontStyle(
                              AppFontSize.headlineSmall,
                              AppColors.contentPrimary),
                        ),
                        Text(
                          'Payment has been Done using Khalti Digital Wallet and '
                          'has een verifies Successfully.',
                          textAlign: TextAlign.justify,
                          style: AppFontStyle().fontStyle(
                              AppFontSize.caption, AppColors.contentTernary),
                        ),
                        const Text('15 mins ago')
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
