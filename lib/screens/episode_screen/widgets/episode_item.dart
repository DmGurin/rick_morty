import 'package:flutter/material.dart';
import 'package:rick_morty/screens/series_screen.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class EpisodeItem extends StatelessWidget {
  const EpisodeItem({
    Key? key,
    required this.image,
    required this.id,
    required this.name,
    required this.airDate,
  }) : super(key: key);
  final String image;
  final int id;
  final String name;
  final String airDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SeriesScreen()));
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'СЕРИЯ $id',
                style: AppTextStyle.textStyle10w500,
              ),
              Text(
                name,
                style: AppTextStyle.textStyle16w500,
              ),
              Text(
                airDate,
                style: AppTextStyle.textStyle13w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
