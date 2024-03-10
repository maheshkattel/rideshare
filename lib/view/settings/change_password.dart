import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import 'package:ridesharingapp/resources/components/text_field_form.dart';
import '../../resources/components/app_bar.dart';
import '../../resources/components/primary_button.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Change Password', centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              AppTextFormField(
                focusNode: FocusNode(),
                controller: TextEditingController(),
                hintText: 'Old Password',
                onSubmit: (value) {},
                regExp: RegExp(r'[a-zA-Z]$'),
              ),
              sizedBox20(),
              AppTextFormField(
                focusNode: FocusNode(),
                controller: TextEditingController(),
                hintText: 'New Password',
                onSubmit: (value) {},
                regExp: RegExp(r'[a-zA-Z]$'),
              ),
              sizedBox20(),
              AppTextFormField(
                focusNode: FocusNode(),
                controller: TextEditingController(),
                hintText: 'Confirm Password',
                onSubmit: (value) {},
                regExp: RegExp(r'[a-zA-Z]$'),
              ),
              sizedBox20(),
              PrimaryButton(title: 'Save', onPress: () {})
            ],
          ),
        ),
      ),
    );
  }
}
