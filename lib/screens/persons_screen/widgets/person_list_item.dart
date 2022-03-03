import 'package:flutter/material.dart';
import 'package:rick_morty/source/widget/avatar_widget.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class PersonListItem extends StatelessWidget {
  const PersonListItem({
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
      child: Row(
        children: [
          AvatarWidget(image: image),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ],
      ),
    );
  }
}
