import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_style.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/resources/components/button_withIcon.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import 'package:ridesharingapp/resources/components/text_field_form.dart';
import 'package:ridesharingapp/utils/utils.dart';
import 'package:ridesharingapp/view_model/registration/registration_screen_controller.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/primary_button.dart';
import '../../resources/routes/routes_name.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final registrationVM = RegistrationScreenController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    registrationVM.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: appAppBar(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Sign up with your Email or phone Number',
                      style: AppFontStyle().fontStyle(
                          AppFontSize.titleMedium, AppColors.contentSecondary),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          AppTextFormField(
                            hintText: 'Email',
                            focusNode: registrationVM.emailFocusNode,
                            controller: registrationVM.emailController,
                            onSubmit: (value) {
                              Utils.fieldFocusChange(
                                  context,
                                  registrationVM.emailFocusNode,
                                  registrationVM.passwordFocusNode);
                            },
                            regExp: RegExp(
                                r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$'),
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            obscureText: true,
                            hintText: 'Password',
                            focusNode: registrationVM.passwordFocusNode,
                            controller: registrationVM.passwordController,
                            onSubmit: (value) {},
                            regExp: RegExp(r'[0-9A-Za-z_@!#$]$'),
                          ),
                        ],
                      ),
                    ),
                    sizedBox20(),
                    Row(
                      children: [
                        Checkbox(
                            value: registrationVM.terms.value,
                            activeColor: Colors.green.shade600,
                            shape: const CircleBorder(),
                            onChanged: (value) {
                              registrationVM.termsAndConditions(value!);
                            }),
                        Expanded(
                          child: SizedBox(
                            height: 20,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                RichText(
                                    overflow: TextOverflow.ellipsis,
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'agree to ',
                                          style: AppFontStyle().fontStyle(
                                              AppFontSize.bodySmall,
                                              AppColors.contentDisabled)),
                                    ])),
                                InkWell(
                                  onTap: () {
                                    registrationVM.showTerms(context);
                                  },
                                  child: Text(
                                      'Terms and Conditions/ Privacy Policy',
                                      style: AppFontStyle().fontStyle(
                                          AppFontSize.bodySmall,
                                          AppColors.primaryColor)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                        title: 'Sign Up',
                        loading: registrationVM.loading.value,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {}
                          registrationVM.registerUser();
                        }),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Text(
                            'or',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.bodyLarge,
                                AppColors.contentDisabled),
                          ),
                        ),
                        const Expanded(child: Divider())
                      ],
                    ),
                    const SizedBox(height: 20),
                    ButtonWithIcon(
                        onPress: () {},
                        title: 'SignUp with Gmail',
                        image: ImageAssets.gmailImage),
                    const SizedBox(height: 20),
                    ButtonWithIcon(
                        onPress: () {},
                        title: 'SignUp with Facebook',
                        image: ImageAssets.facebookImage),
                    const SizedBox(height: 20),
                    ButtonWithIcon(
                        onPress: () {},
                        title: 'SignUp with Apple',
                        image: ImageAssets.appleImage),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account?   ',
                          style: AppFontStyle().fontStyle(
                              AppFontSize.subheadLarge,
                              AppColors.contentPrimary),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.loginScreen);
                          },
                          child: Text(
                            'Sign In',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadLarge,
                                AppColors.primaryColor700),
                          ),
                        )
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
