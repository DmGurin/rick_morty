import 'package:flutter/cupertino.dart';
import 'package:rick_morty/style/app_colors.dart';
import 'package:rick_morty/style/app_text_styles.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    Key? key,
    required this.image,
    required this.nameLocation,
    required this.typeLocation,
    required this.dimension,
  }) : super(key: key);
  final String image;
  final String nameLocation;
  final String typeLocation;
  final String dimension;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              color: AppColors.greyLight,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nameLocation,
                  style: AppTextStyle.textStyle20w500,
                  textAlign: TextAlign.start,
                ),
                Text(
                  '$typeLocation \u{00B7} $dimension',
                  style: AppTextStyle.textStyle13w500,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
