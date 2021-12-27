import 'package:flutter/material.dart';
import 'package:rick_morty/screens/edit_profile_screen/widgets/fio_body.dart';
import 'package:rick_morty/screens/edit_profile_screen/widgets/login_body.dart';
import 'package:rick_morty/sourse/constans.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key,
  required this.type,
  }) : super(key: key);
  final TextFieldType type;

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
                'Изменить ФИО',
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        body: Padding(
          padding: const EdgeInsets.all(23),
          child: Column(
            children: [
              if (type == TextFieldType.fio) const FioBody(),
              if (type == TextFieldType.login) const LoginBody(),
              const Spacer(),
              Container(
                child: const Center(
                  child: Text(
                    'Сохранить',
                    style: AppTextStyle.textStyle17w500,
                    textAlign: TextAlign.center,
                  ),
                ),
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ],
          ),
        ));

  }
}
