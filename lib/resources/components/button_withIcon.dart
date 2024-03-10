import 'package:flutter/material.dart';

import '../assets/fonts/font_size.dart';
import '../assets/fonts/fonts_Style.dart';
import '../colors/color.dart';

class ButtonWithIcon extends StatelessWidget {
  const ButtonWithIcon(
      {super.key,
      required this.onPress,
      required this.title,
      required this.image});
  final Function() onPress;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: 54,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              border: Border.all(color: AppColors.textColor),
              borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.fill)),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: AppFontStyle().fontStyle(
                    AppFontSize.subheadLarge, AppColors.contentPrimary),
              ),
            ],
          )),
    );
  }
}
