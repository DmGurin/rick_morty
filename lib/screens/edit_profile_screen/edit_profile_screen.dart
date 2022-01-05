import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/profile_screen/profile_screen.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/images.dart';
import 'package:rick_morty/source/svg.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.darkBlue,
        title: Row(
          children: const [
            SizedBox(
              width: 25,
            ),
            Text(
              'Редактировать профиль',
              style: TextStyle(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(23),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();
                    print(result!.count);
                  },
                  child: CircleAvatar(
                    radius: 60,
                    child: Image.asset(AppImages.morty),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Изменить фото',
                  style: AppTextStyle.textStyle18w500,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ПРОФИЛЬ',
                    style: AppTextStyle.textStyle13w500,
                  ),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen(
                              type: TextFieldType.fio,
                            )));
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: const Text(
                    'Изменить ФИО',
                    style: AppTextStyle.textStyle16w500,
                  ),
                  subtitle: const Text(
                    'Oleg Belozerkovsky',
                    style: AppTextStyle.textStyle13w500,
                  ),
                  trailing: SvgPicture.asset(AppSvg.arrowright),
                ),
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen(
                              type: TextFieldType.login,
                            )));
                  },
                  contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                  title: const Text(
                    'Логин',
                    style: AppTextStyle.textStyle16w500,
                  ),
                  subtitle: const Text(
                    'Rick',
                    style: AppTextStyle.textStyle13w500,
                  ),
                  trailing: SvgPicture.asset(AppSvg.arrowright),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
