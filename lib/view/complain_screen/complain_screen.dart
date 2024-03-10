import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/text_field_form.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/sized_Box20.dart';

class ComplainScreen extends StatelessWidget {
  const ComplainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Complain', centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            children: [
              AppTextFormField(
                focusNode: FocusNode(),
                controller: TextEditingController(),
                hintText: 'Please let us know your Complain',
                onSubmit: (value) {},
                regExp: RegExp(r'[a-zA-Z]$'),
              ),
              sizedBox20(),
              PrimaryButton(
                  title: 'Submit',
                  onPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          backgroundColor: AppColors.whiteColor,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                  height: 124,
                                  width: 124,
                                  child: Image.asset(ImageAssets.pass)),
                              Text(
                                'Send Successful',
                                style: AppFontStyle().fontStyle(
                                    AppFontSize.titleMedium,
                                    AppColors.contentSecondary),
                              ),
                              Text(
                                'Your complain has benn send successfully',
                                textAlign: TextAlign.center,
                                style: AppFontStyle().fontStyle(
                                    AppFontSize.bodySmall,
                                    AppColors.contentTernary),
                              )
                            ],
                          ),
                          actions: [
                            PrimaryButton(
                                title: 'Back Home',
                                onPress: () {
                                  Get.back();
                                })
                          ],
                        );
                      },
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
