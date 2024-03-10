import 'package:flutter/material.dart';

import '../../../resources/assets/fonts/font_size.dart';
import '../../../resources/assets/fonts/fonts_Style.dart';
import '../../../resources/colors/color.dart';

class CarContainer extends StatelessWidget {
  const CarContainer({super.key, required this.text, required this.heading});
  final String text;
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Container(
        height: 44,
        decoration: BoxDecoration(
            color: AppColors.primaryColor50,
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 13, bottom: 12, left: 15, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(heading,
                  style: AppFontStyle().fontStyle(
                      AppFontSize.subheadSmall, AppColors.contentTernary)),
              Text(text,
                  style: AppFontStyle().fontStyle(
                      AppFontSize.subheadSmall, AppColors.contentTernary))
            ],
          ),
        ),
      ),
    );
  }
}
