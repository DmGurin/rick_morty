import 'package:flutter/material.dart';
import 'package:rick_morty/source/widget/text_filed/search_text_field.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class SeasonsScreen extends StatefulWidget {
  const SeasonsScreen({Key? key}) : super(key: key);

  @override
  State<SeasonsScreen> createState() => _SeasonsScreenState();
}

class _SeasonsScreenState extends State<SeasonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: const SearchTextField(),
      ),
      backgroundColor: AppColors.darkBlue,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   'ВСЕГО СЕРИЙ: ${episode.length}',
                //   style:
                //   AppTextStyle.textStyle16w500.copyWith(color: AppColors.grey),
                // ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            // ListView.builder(
            //   physics: const NeverScrollableScrollPhysics(),
            //     //shrinkWrap: true,
            //     //itemCount: state.seasons.length,
            //     itemBuilder: (context, index) {
            //     // return SeasonItem(
            //     //   image: season[index].image! ,
            //     //   id: season[index].id,
            //     //   name: season[index].name,
            //     //   airDate: season[index].airDate,
            //     // );
            //     }
            // )
          ],
          ),
      ),
    );
  }
}
