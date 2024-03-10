import 'package:flutter/material.dart';
import 'package:ridesharingapp/resources/assets/fonts/font_size.dart';
import 'package:ridesharingapp/resources/assets/fonts/fonts_Style.dart';
import 'package:ridesharingapp/resources/components/sized_Box20.dart';
import '../../resources/colors/color.dart';
import '../../resources/components/app_bar.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appAppBar(title: 'History', centreTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              const Row(
                children: [
                  HistoryContainer(
                      text: 'Upcoming',
                      buttonColor: AppColors.primaryColor700,
                      textColor: AppColors.whiteColor),
                  HistoryContainer(
                    text: 'Completed',
                  ),
                  HistoryContainer(
                    text: 'Canceled',
                  ),
                ],
              ),
              sizedBox20(),
              Container(
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryColor700)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mahesh',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadSmall,
                                AppColors.contentSecondary),
                          ),
                          Text(
                            'Mustang Shelby Gt',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.bodySmall,
                                AppColors.contentDisabled),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Today at 9:20 am',
                        style: AppFontStyle().fontStyle(
                            AppFontSize.bodySmall, AppColors.contentSecondary),
                      )
                    ],
                  ),
                ),
              ),
              sizedBox20(),
              Container(
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryColor700)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mahesh',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadSmall,
                                AppColors.contentSecondary),
                          ),
                          Text(
                            'Mustang Shelby Gt',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.bodySmall,
                                AppColors.contentDisabled),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Today at 9:20 am',
                        style: AppFontStyle().fontStyle(
                            AppFontSize.bodySmall, AppColors.contentSecondary),
                      )
                    ],
                  ),
                ),
              ),
              sizedBox20(),
              Container(
                height: 64,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.primaryColor700)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mahesh',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.subheadSmall,
                                AppColors.contentSecondary),
                          ),
                          Text(
                            'Mustang Shelby Gt',
                            style: AppFontStyle().fontStyle(
                                AppFontSize.bodySmall,
                                AppColors.contentDisabled),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        'Today at 9:20 am',
                        style: AppFontStyle().fontStyle(
                            AppFontSize.bodySmall, AppColors.contentSecondary),
                      )
                    ],
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

class HistoryContainer extends StatelessWidget {
  const HistoryContainer(
      {super.key,
      this.buttonColor = AppColors.primaryColor50,
      required this.text,
      this.textColor = AppColors.blackColor});
  final Color buttonColor;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            text,
            style: AppFontStyle().fontStyle(AppFontSize.caption, textColor),
          ),
        ),
      ),
    );
  }
}
