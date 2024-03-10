import 'package:flutter/material.dart';
import '../../../resources/assets/fonts/fonts_Style.dart';
import '../../../resources/colors/color.dart';

class SharedContainerCar extends StatelessWidget {
  const SharedContainerCar({
    required this.icon,
    required this.text1,
    required this.text2,
    super.key,
  });
  final IconData icon;
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 79,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.primaryColor),
          color: AppColors.primaryColor50),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Icon(icon, size: 24),
            Text(
              text1,
              style: AppFontStyle().fontStyle(10, AppColors.contentTernary),
            ),
            Text(
              text2,
              style: AppFontStyle().fontStyle(8, AppColors.contentTernary),
            )
          ],
        ),
      ),
    );
  }
}
