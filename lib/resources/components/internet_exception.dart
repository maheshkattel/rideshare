import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../colors/color.dart';

class InternetExceptionWidget extends StatelessWidget {
  const InternetExceptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          sizedBox20(),
          Icon(Icons.cloud_off, color: AppColors.errorColor),
          Text(
            'We are unable to show results \nPlease check your Internet Connection',
            style: AppFontStyle()
                .fontStyle(AppFontSize.bodyLarge, AppColors.contentSecondary),
          ),
          sizedBox20(),
          PrimaryButton(title: 'Retry', onPress: () {})
        ],
      ),
    );
  }
}
