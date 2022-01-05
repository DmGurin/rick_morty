import 'package:flutter/material.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class PersonGridItem extends StatelessWidget {
  const PersonGridItem({
    Key? key,
    required this.image,
    required this.alive,
    required this.male,
    required this.name,
    required this.race,
  }) : super(key: key);

  final String image;
  final bool alive;
  final String male;
  final String name;
  final String race;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 18,
          ),
          Text(
            alive ? 'Живой': 'Мертвый',
            style: AppTextStyle.textStyle14w500,
          ),
          Text(
            name,
            style: AppTextStyle.textStyle16w500,
          ),
          Text(
            '$race, $male',
            textAlign: TextAlign.right,
            style: AppTextStyle.textStyle13w500,
          ),
        ],
      ),
    );
  }
}