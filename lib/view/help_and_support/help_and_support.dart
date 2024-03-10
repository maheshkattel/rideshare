import 'package:flutter/material.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';
import '../../resources/components/sized_Box20.dart';

class HelpandSupport extends StatelessWidget {
  const HelpandSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Help and Support", centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Help and Support',
                style: AppFontStyle()
                    .fontStyle(AppFontSize.headlineSmall, AppColors.blackColor),
              ),
              sizedBox20(),
              Text(
                textAlign: TextAlign.justify,
                'Lorem ipsum dolor sit amet consectetur. Sit pulvinar mauris mauris eu nibh semper nisl pretium laoreet. Sed non faucibus ac lectus eu arcu. Nulla sit congue facilisis vestibulum egestas nisl feugiat pharetra. Odio sit tortor morbi at orci ipsum dapibus interdum. Lorem felis est aliquet arcu nullam pellentesque. Et habitasse ac arcu et nunc euismod rhoncus facilisis sollicitudin.',
                style: AppFontStyle().fontStyle(
                    AppFontSize.labelMedium, AppColors.contentSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
