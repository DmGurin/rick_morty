import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/screens/episodes_screen/season_entity.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class SeasonList extends StatelessWidget {
  const SeasonList({
    Key? key,
    required this.seasonList,
  }) : super(key: key);

  final List<SeasonEntity> seasonList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: seasonList.length,
        itemBuilder: (BuildContext context, int index) => Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 2),
          margin: const EdgeInsets.only(right: 16),
          decoration: const BoxDecoration(
              border: Border(
            bottom: BorderSide(width: 2.0, color: AppColors.white),
          )),
          child: Center(
            child: Text(
              'СЕЗОН ${seasonList[index].id}',
              style: AppTextStyle.textStyle17w500,
            ),
          ),
        ),
      ),
    );
  }
}
