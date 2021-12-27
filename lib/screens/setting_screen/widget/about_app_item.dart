import 'package:flutter/material.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class AboutAppItem extends StatelessWidget {
  const AboutAppItem({
    Key? key,
    required this.about,
  }) : super(key: key);
  final String about;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'О ПРИЛОЖЕНИИ',
        style: AppTextStyle.textStyle13w500,
      ),
      const SizedBox(
        height: 24,
      ),
      Text(
        about,
        style: AppTextStyle.textStyle13ww500,
      ),
      const Divider(
        height: 50,
        thickness: 1,
        color: AppColors.grey,
      ),
    ]);
  }
}
