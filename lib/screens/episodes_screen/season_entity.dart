import 'package:rick_morty/screens/episodes_screen/episode_entity.dart';

class SeasonEntity {
  SeasonEntity({
    required this.id,
    required this.episodeList,
  });
  final int id;
  final List<EpisodeEntity> episodeList;
}
