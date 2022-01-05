import 'package:flutter/material.dart';
import 'package:rick_morty/screens/setting_screen/widget/about_app_item.dart';
import 'package:rick_morty/screens/setting_screen/widget/profile_item.dart';
import 'package:rick_morty/screens/setting_screen/widget/theme_item.dart';
import 'package:rick_morty/screens/setting_screen/widget/version_app_item.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/style/app_colors.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.darkBlue,
          title: const Text(
            'Настройки',
            style: TextStyle(
              color: AppColors.white,
            ),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(23),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ProfileItem(
                name: profile.name,
                login: profile.login,
                avatar: profile.avatar,
              ),
              ThemeItem(
                theme: theme,
              ),
              AboutAppItem(
                about: about,
              ),
              VersionAppItem(
                version: version,
              ),
            ],
          ),
        ));
  }
}
