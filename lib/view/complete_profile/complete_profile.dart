import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/components/primary_button.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import 'package:ridesharingapp/resources/components/text_field_form.dart';
import 'package:ridesharingapp/utils/utils.dart';
import 'package:ridesharingapp/view_model/complete_profile/complete_profile_controller.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/colors/color.dart';

class CompleteProfileScreen extends StatelessWidget {
  CompleteProfileScreen({super.key});
  final completeVM = CompleteProfileController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.whiteColor,
            title: Text('Profile',
                style: AppFontStyle().fontStyle(
                    AppFontSize.headlineLarge, AppColors.blackColor)),
            centerTitle: true,
            leading: InkWell(
                onTap: Get.back, child: const Icon(CupertinoIcons.back)),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //Circle Avatar
                    Center(
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: completeVM.imagePath.isEmpty
                              ? null
                              : FileImage(File(completeVM.imagePath.value)),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: InkWell(
                            onTap: () {
                              completeVM.selectProfilePic();
                            },
                            child: const Icon(
                              CupertinoIcons.camera_circle_fill,
                              size: 30,
                              color: AppColors.primaryColor700,
                            ),
                          ),
                        )
                      ]),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _key,
                      child: Column(
                        children: [
                          AppTextFormField(
                            focusNode: completeVM.nameFocus,
                            controller: completeVM.nameController,
                            hintText: 'Full Name',
                            onSubmit: (value) {
                              Utils.fieldFocusChange(context,
                                  completeVM.nameFocus, completeVM.phoneFocus);
                            },
                            regExp: RegExp(r'[a-zA-Z]$'),
                          ),
                          sizedBox20(),
                          AppTextFormField(
                            focusNode: completeVM.phoneFocus,
                            controller: completeVM.phoneController,
                            hintText: '+977 98',
                            onSubmit: (value) {
                              Utils.fieldFocusChange(context,
                                  completeVM.phoneFocus, completeVM.emailFocus);
                            },
                            regExp: RegExp(r'[?9][0-9]{9}$'),
                          ),
                          sizedBox20(),
                          AppTextFormField(
                            focusNode: completeVM.emailFocus,
                            controller: completeVM.emailController,
                            hintText: 'Email',
                            onSubmit: (value) {},
                            regExp: RegExp(
                                r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$'),
                          ),
                          sizedBox20(),
                          Row(
                            children: [
                              Text('Gender:',
                                  style: AppFontStyle().fontStyle(
                                      AppFontSize.headlineSmall,
                                      AppColors.contentSecondary)),
                              Radio(
                                  value: gender[0],
                                  groupValue: completeVM.selectedGender.value,
                                  onChanged: (value) {
                                    completeVM.updateGender(value!);
                                  }),
                              const Text('Male'),
                              Radio(
                                  value: gender[1],
                                  groupValue: completeVM.selectedGender.value,
                                  onChanged: (value) {
                                    completeVM.updateGender(value!);
                                  }),
                              const Text('Female')
                            ],
                          ),
                          sizedBox20(),
                          Row(
                            children: [
                              Text('District:',
                                  style: AppFontStyle().fontStyle(
                                      AppFontSize.headlineSmall,
                                      AppColors.contentSecondary)),
                              const Spacer(),
                              DropdownMenu(
                                initialSelection:
                                    completeVM.selectedDistrict.value,
                                dropdownMenuEntries: list
                                    .map<DropdownMenuEntry<String>>(
                                        (String value) {
                                  return DropdownMenuEntry<String>(
                                      value: value, label: value);
                                }).toList(),
                                onSelected: (value) {
                                  completeVM.selectedDistrict(value);
                                },
                              ),
                            ],
                          ),
                          sizedBox20(),
                          AppTextFormField(
                            focusNode: completeVM.cityFocus,
                            controller: completeVM.cityController,
                            hintText: 'City',
                            onSubmit: (value) {
                              Utils.fieldFocusChange(context,
                                  completeVM.cityFocus, completeVM.streetFocus);
                            },
                            regExp: RegExp(r'[a-zA-Z]$'),
                          ),
                          sizedBox20(),
                          AppTextFormField(
                            focusNode: completeVM.streetFocus,
                            controller: completeVM.streetController,
                            hintText: 'Street',
                            onSubmit: (value) {},
                            regExp: RegExp(r'[a-zA-Z0-9,-.]$'),
                          ),
                          sizedBox20(),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: PrimaryButton(
                                title: 'Cancel',
                                textColor: AppColors.blackColor,
                                buttonColor: AppColors.whiteColor,
                                borderColor: AppColors.primaryColor700,
                                onPress: () {
                                  Get.back();
                                })),
                        const SizedBox(width: 5),
                        Expanded(
                            child: PrimaryButton(
                                title: 'Save',
                                loading: completeVM.loading.value,
                                onPress: () {
                                  if (_key.currentState!.validate()) {}
                                  completeVM.saveUserDetails();
                                }))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
