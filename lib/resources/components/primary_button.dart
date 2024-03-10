import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_style.dart';
import 'package:ridesharingapp/resources/colors/color.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      this.loading = false,
      this.width = double.infinity,
      this.buttonColor = AppColors.primaryColor700,
      this.textColor = AppColors.whiteColor,
      this.borderColor = AppColors.whiteColor,
      required this.title,
      required this.onPress});
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Color borderColor;
  final double width;
  final Function() onPress;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: 54,
          decoration: BoxDecoration(
              color: buttonColor,
              border: Border.all(color: borderColor),
              borderRadius: BorderRadius.circular(8)),
          child: Center(
            child: loading
                ? const CircularProgressIndicator(color: AppColors.whiteColor)
                : Text(
                    title,
                    style: AppFontStyle()
                        .fontStyle(AppFontSize.subheadLarge, textColor),
                  ),
          )),
    );
  }
}
