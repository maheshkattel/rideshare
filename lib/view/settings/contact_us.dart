import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/text_field_form.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';
import '../../resources/components/sized_Box20.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Privacy and Policy", centreTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Contact Us for Ride Share',
                    style: AppFontStyle().fontStyle(
                        AppFontSize.headlineSmall, AppColors.blackColor)),
                sizedBox20(),
                Text('Address',
                    style: AppFontStyle().fontStyle(
                        AppFontSize.subheadLarge, AppColors.blackColor)),
                Text(
                  textAlign: TextAlign.center,
                  'House# 72, Road# 21, Janpath, Biratnagr-1213 (near Everest  School &\nCollege, beside Tribhuvan University)\n\nCall : 13301 (24/7)\nEmail : support@pathao.com',
                  style: AppFontStyle().fontStyle(
                      AppFontSize.bodySmall, AppColors.contentSecondary),
                ),
                sizedBox20(),
                Text('Send Message:',
                    style: AppFontStyle().fontStyle(
                        AppFontSize.subheadLarge, AppColors.blackColor)),
                sizedBox20(),
                AppTextFormField(
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  hintText: 'Name',
                  onSubmit: (value) {},
                  regExp: RegExp(r'[a-zA-Z]$'),
                ),
                sizedBox20(),
                AppTextFormField(
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  hintText: 'Email',
                  onSubmit: (value) {},
                  regExp: RegExp(r'[a-zA-Z]$'),
                ),
                sizedBox20(),
                AppTextFormField(
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  hintText: 'Phone',
                  onSubmit: (value) {},
                  regExp: RegExp(r'[a-zA-Z]$'),
                ),
                sizedBox20(),
                AppTextFormField(
                  focusNode: FocusNode(),
                  controller: TextEditingController(),
                  hintText: 'Message Here',
                  onSubmit: (value) {},
                  regExp: RegExp(r'[a-zA-Z]$'),
                ),
                sizedBox20(),
                PrimaryButton(title: 'Send Message', onPress: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
