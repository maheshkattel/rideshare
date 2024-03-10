import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assets/fonts/font_size.dart';
import '../assets/fonts/fonts_style.dart';
import '../colors/color.dart';

AppBar appAppBar({String title = 'Back', bool centreTitle = false}) {
  return AppBar(
    backgroundColor: AppColors.whiteColor,
    centerTitle: centreTitle,
    title: Text(title,
        style: AppFontStyle().fontStyle(
            centreTitle == false
                ? AppFontSize.labelLarge
                : AppFontSize.headlineSmall,
            AppColors.blackColor)),
    leading: InkWell(onTap: Get.back, child: const Icon(CupertinoIcons.back)),
  );
}
