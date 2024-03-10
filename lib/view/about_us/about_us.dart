import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';

import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "About Us", centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.justify,
                'Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We\'re dedicated to providing you the best of Rideshare with a focus on dependability and Earning. We\'re working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.Professional Rideshare Platform. Here we will provide you only interesting content, which you will like very much. We\'re dedicated to providing you the best of Rideshare, with a focus on dependability and Earning. We\'re working to turn our passion for Rideshare into a booming online website. We hope you enjoy our Rideshare as much as we enjoy offering them to you. I will keep posting more important posts on my Website for all of you. Please give your support and love.',
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
