import 'package:flutter/material.dart';
import 'package:rick_morty/data/models/episode_model.dart';
import 'package:rick_morty/screens/episodes_screen/widgets/episode_item.dart';
import 'package:rick_morty/source/constants.dart';

class EpisodesBody extends StatelessWidget {
  const EpisodesBody({Key? key,
  required this.episodes,
  }) : super(key: key);
  final List<EpisodeModel> episodes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      shrinkWrap: true,
      itemCount: episodes.length,
      itemBuilder: (context, index) {
        return EpisodesItem(
          image: episodes[index].image! ,
          id: episodes[index].id,
          name: episodes[index].name,
          airDate: episodes[index].airDate,
        );
      },
    );
  }
}
