import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/images/image_assets.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'Change Language', centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.contentSecondary)),
                child: ListTile(
                  leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(ImageAssets.english)),
                  title: const Text('English'),
                  subtitle: const Text('English'),
                  trailing: Checkbox(
                    shape: const CircleBorder(),
                    onChanged: (a) {},
                    value: true,
                    activeColor: AppColors.primaryColor700,
                  ),
                ),
              ),
              sizedBox20(),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.contentSecondary)),
                child: ListTile(
                  leading: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(ImageAssets.nepali)),
                  title: const Text('Nepali'),
                  subtitle: const Text('Nepali'),
                  trailing: Checkbox(
                    shape: const CircleBorder(),
                    onChanged: (a) {},
                    value: false,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
