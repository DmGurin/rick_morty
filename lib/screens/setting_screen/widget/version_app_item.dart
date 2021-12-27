import 'package:flutter/material.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class VersionAppItem extends StatelessWidget {
  const VersionAppItem({
    Key? key,
    required this.version,
  }) : super(key: key);
  final String version;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'ВЕРСИЯ ПРИЛОЖЕНИЯ',
          style: AppTextStyle.textStyle13w500,
        ),
      ),
      const SizedBox(
        height: 24,
      ),
      Text(
        version,
        style: AppTextStyle.textStyle13ww500,
      ),
    ]);
  }
}
