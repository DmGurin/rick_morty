import 'package:flutter/material.dart';
import 'package:rick_morty/source/widget/theme_dialog/theme_body.dart';
import 'package:rick_morty/style/app_colors.dart';

void showThemeDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor: AppColors.greyLight,
          child: const ThemeBody(),
        );
      });
}
