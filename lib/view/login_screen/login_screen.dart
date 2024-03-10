import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ridesharingapp/resources/components/app_bar.dart';
import 'package:ridesharingapp/view_model/login_screen/login_screen_controller.dart';
import '../../resources/assets/fonts/font_size.dart';
import '../../resources/assets/fonts/fonts_Style.dart';
import '../../resources/assets/images/image_assets.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/button_withIcon.dart';
import '../../resources/components/primary_button.dart';
import '../../resources/components/text_field_form.dart';
import '../../resources/routes/routes_name.dart';
import '../../utils/utils.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final loginVM = LoginScreenController();
  final _formKey = GlobalKey<FormState>();

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
                      'Sign in with your Email or phone Number',
                      style: AppFontStyle().fontStyle(
                          AppFontSize.titleMedium, AppColors.contentSecondary),
                    ),
                    const SizedBox(height: 30),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            hintText: 'Email',
                            focusNode: loginVM.emailFocusNode,
                            controller: loginVM.emailController,
                            onSubmit: (value) {
                              Utils.fieldFocusChange(
                                  context,
                                  loginVM.emailFocusNode,
                                  loginVM.passwordFocusNode);
                            },
                            regExp: RegExp(
                                r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})$'),
                          ),
                          const SizedBox(height: 20),
                          AppTextFormField(
                            hintText: 'Enter Password',
                            obscureText: true,
                            focusNode: loginVM.passwordFocusNode,
                            controller: loginVM.passwordController,
                            onSubmit: (value) {},
                            regExp: RegExp(r'[a-zA-Z0-9!@#$&_]$'),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Spacer(),
                              Text('forget password?',
                                  style: AppFontStyle().fontStyle(
                                      AppFontSize.subheadSmall,
                                      AppColors.errorColor)),
                            ],
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                    PrimaryButton(
                        title: 'Log In',
                        loading: loginVM.loading.value,
                        onPress: () {
                          if (_formKey.currentState!.validate()) {}
                          loginVM.login();
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
                        title: 'Login with Gmail',
                        image: ImageAssets.gmailImage),
                    const SizedBox(height: 20),
                    ButtonWithIcon(
                        onPress: () {},
                        title: 'Login with Facebook',
                        image: ImageAssets.facebookImage),
                    const SizedBox(height: 20),
                    ButtonWithIcon(
                        onPress: () {},
                        title: 'Login with Apple',
                        image: ImageAssets.appleImage),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account?   ',
                          style: AppFontStyle().fontStyle(
                              AppFontSize.subheadLarge,
                              AppColors.contentPrimary),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.registrationScreen);
                          },
                          child: Text(
                            'Sign Up',
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
