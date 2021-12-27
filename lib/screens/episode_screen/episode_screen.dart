import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty/screens/episode_screen/widgets/episode_item.dart';
import 'package:rick_morty/screens/episode_screen/widgets/season_list.dart';
import 'package:rick_morty/sourse/constans.dart';
import 'package:rick_morty/sourse/svg.dart';
import 'package:rick_morty/style/app_colors.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: TextField(
          onSubmitted: (text) {},
          onChanged: (text) {},
          cursorColor: AppColors.grey,
          style: const TextStyle(
            color: AppColors.grey,
          ),
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.all(22.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const VerticalDivider(
                      color: AppColors.grey,
                      thickness: 1,
                      width: 1,
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    SvgPicture.asset(
                      AppSvg.filter,
                    ),
                  ],
                ),
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(19.0),
              child: SvgPicture.asset(
                AppSvg.search,
              ),
            ),
            fillColor: AppColors.greyLight,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 50),
          child: SeasonList(seasonList: seasonList),
        ),
      ),
      backgroundColor: AppColors.darkBlue,
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        itemCount: episodeList.length,
        itemBuilder: (context, index) {
          return EpisodeItem(
            image: episodeList[index].image,
            id: episodeList[index].id,
            name: episodeList[index].name,
            airDate: episodeList[index].airDate,
          );
        },
      ),
    );
  }
}
