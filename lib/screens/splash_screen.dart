import 'package:flutter/material.dart';
import 'package:rick_morty/sourse/images.dart';
import 'package:rick_morty/style/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Padding(
        padding: const EdgeInsets.only(top: 54.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(child: Image.asset(AppImages.logo)),
            Align(
              alignment: Alignment.bottomCenter,
                child: Image.asset(AppImages.face)),
          ],
        ),
      ),
    );
  }
}
