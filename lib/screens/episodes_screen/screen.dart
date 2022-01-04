import 'package:flutter/material.dart';
import 'package:rick_morty/screens/episodes_screen/widgets/body.dart';
import 'package:rick_morty/screens/episodes_screen/widgets/season_list.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/widget/text_filed/search_text_field.dart';
import 'package:rick_morty/style/app_colors.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: const SearchTextField(),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: SeasonList(seasonList: seasonList),
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      body: const EpisodesBody(),
    );
  }
}
