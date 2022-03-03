import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rick_morty/screens/episodes_screen/episode_screen/screen.dart';
import 'package:rick_morty/screens/episodes_screen/screen.dart';
import 'package:rick_morty/screens/locations_screen/screen.dart';
import 'package:rick_morty/screens/persons_screen/screen.dart';
import 'package:rick_morty/screens/profile_screen/profile_screen.dart';
import 'package:rick_morty/screens/setting_screen/screen.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/svg.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_theme.dart';

import '../splash_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onItemTapped(int index) {
    setState(() {
      controller.jumpToPage(index);
      currentIndex = index;
    });
  }

  PageController controller = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: const [
          PersonsScreen(),
          LocationScreen(),
          EpisodesScreen(),
          SettingScreen(),
          ProfileScreen(
            type: TextFieldType.fio,
          ),
          SeriesScreen(),
          SplashScreen(),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.greyLight,
        selectedIconTheme: AppTheme.activeTheme,
        unselectedIconTheme: AppTheme.unActiveTheme,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.person,
              color: currentIndex == 0 ? AppColors.green : AppColors.grey,
            ),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.location,
              color: currentIndex == 1 ? AppColors.green : AppColors.grey,
            ),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.episode,
              color: currentIndex == 2 ? AppColors.green : AppColors.grey,
            ),
            label: 'Епизоды',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvg.settings,
              color: currentIndex == 3 ? AppColors.green : AppColors.grey,
            ),
            label: 'Настройки',
          ),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
