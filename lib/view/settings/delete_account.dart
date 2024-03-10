import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';

class DeleteAccount extends StatelessWidget {
  const DeleteAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: "Delete Account", centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              Text(
                textAlign: TextAlign.justify,
                'Are you sure you want to delete your account? Please read how account deletion will affect.\nDeleting your account removes personal information our database. Tour email becomes permanently reserved and same email cannot be re-use to register a new account.',
                style: AppFontStyle().fontStyle(
                    AppFontSize.labelMedium, AppColors.contentSecondary),
              ),
              sizedBox20(),
              PrimaryButton(
                  title: 'Delete ',
                  buttonColor: AppColors.errorColor,
                  onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
