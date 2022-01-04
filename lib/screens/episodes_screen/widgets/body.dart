import 'package:flutter/material.dart';
import 'package:rick_morty/screens/episodes_screen/widgets/episode_item.dart';
import 'package:rick_morty/source/constants.dart';

class EpisodesBody extends StatelessWidget {
  const EpisodesBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: episodeList.length,
      itemBuilder: (context, index) {
        return EpisodesItem(
          image: episodeList[index].image,
          id: episodeList[index].id,
          name: episodeList[index].name,
          airDate: episodeList[index].airDate,
        );
      },
    );
  }
}
