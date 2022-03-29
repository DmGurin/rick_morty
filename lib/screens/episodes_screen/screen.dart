import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty/blocs/episode_bloc/episode_bloc.dart';
import 'package:rick_morty/blocs/episode_bloc/episode_event.dart';
import 'package:rick_morty/blocs/episode_bloc/episode_state.dart';
import 'package:rick_morty/screens/episodes_screen/widgets/body.dart';
import 'package:rick_morty/screens/episodes_screen/widgets/season_list.dart';
import 'package:rick_morty/source/constants.dart';
import 'package:rick_morty/source/widget/text_filed/search_text_field.dart';
import 'package:rick_morty/style/app_colors.dart';

class EpisodesScreen extends StatelessWidget {
  const EpisodesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EpisodesBloc() ..add(InitialEpisodesEvent()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.darkBlue,
          title: const SearchTextField(),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 50),
            child: SeasonList(seasonList: seasonList),
          ),
        ),
        backgroundColor: AppColors.darkBlue,
        body: BlocConsumer<EpisodesBloc, EpisodesState>(
          listener: (context, state){
            if (state is LoadingEpisodesState){
              const CircularProgressIndicator();
            }
          },
          builder: (context, state){
            if (state is DataEpisodesState){
              return  EpisodesBody(episodes: state.episodes);
            }
            return const SizedBox.shrink();
          },
        )
      ),
    );
  }
}
