import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/screens/edit_profile_screen/edit_profile_screen.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key? key,
    required this.name,
    required this.login,
    required this.avatar,
  }) : super(key: key);
  final String name;
  final String login;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 40,
            child: Image.asset(avatar),
          ),
          const SizedBox(
            height: 49,
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyle.textStyle16w500,
              ),
              Text(
                login,
                style: AppTextStyle.textStyle13w500,
              ),
            ],
          ),
        ],
      ),
      const SizedBox(
        height: 35,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const EditProfileScreen()));
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 2.0, color: AppColors.blue),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: const Align(
            alignment: Alignment.center,
            child: Text(
              'Редактировать',
              style: AppTextStyle.textStyle18w500,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
      const Divider(
        height: 50,
        thickness: 1,
        color: AppColors.grey,
      )
    ]);
  }
}
