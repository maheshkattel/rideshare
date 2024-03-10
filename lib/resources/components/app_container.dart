import 'package:flutter/material.dart';

import '../colors/color.dart';

class AppContainer extends StatelessWidget {
  const AppContainer(
      {super.key, this.width = double.infinity, required this.child});

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.primaryColor50),
      child: child,
    );
  }
}
