import 'package:flutter/material.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class PersonGridItem extends StatelessWidget {
  const PersonGridItem({
    Key? key,
    required this.image,
    required this.status,
    required this.gender,
    required this.name,
    required this.species,
  }) : super(key: key);

  final String image;
  final String status;
  final String gender;
  final String name;
  final String species;

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
            status,
            style: AppTextStyle.textStyle14w500,
          ),
          Text(
            name,
            style: AppTextStyle.textStyle16w500,
          ),
          Text(
            '$species, $gender',
            textAlign: TextAlign.right,
            style: AppTextStyle.textStyle13w500,
          ),
        ],
      ),
    );
  }
}