import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/sourse/svg.dart';
import 'package:rick_morty/sourse/widget/theme_dialog/theme_dialog.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class ThemeItem extends StatelessWidget {
  const ThemeItem({
    Key? key,
    required this.theme,
  }) : super(key: key);
  final String theme;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: const Text(
                  'Внешний вид',
                  style: AppTextStyle.textStyle13w500,
                  textAlign: TextAlign.left,
                )),
          ),
          ListTile(
            onTap: () {
              showThemeDialog(context);

    },


            leading: SvgPicture.asset(
              AppSvg.palettetwo,
            ),
            title: Text(
              theme,
              style: AppTextStyle.textStyle16w500,
            ),
            subtitle: const Text(
              'Включена',
              style: AppTextStyle.textStyle13w500,
            ),
            trailing: SvgPicture.asset(AppSvg.arrowright),
          ),
          const Divider(
            height: 50,
            thickness: 1,
            color: AppColors.grey,
          ),
        ]);
  }
}
